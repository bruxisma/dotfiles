<#
.SYNOPSIS
Converts videos to HEVC encoding via CPU for size improvements, while copying
as much metadata as possible. Supports optional audio and subtitle streams.
Seems complex but I've been whittling away at this since before vibe coding.
#>
function ConvertTo-HEVC {
  [CmdletBinding(SupportsShouldProcess, DefaultParameterSetName = "Path")]
  param(
    [Parameter(Position = 0, Mandatory, ParameterSetName = "Path")]
    [String[]]$Path,
    [Parameter(Position = 0, Mandatory, ParameterSetName = "LiteralPath")]
    [String[]]$LiteralPath,

    [Parameter(Position = 1)]
    [String]$Filter,
    [String[]]$Include,
    [String[]]$Exclude,
    [Switch]$Recurse,

    [ValidateSet("Fatal", "Error", "Warning", "Information", "Verbose", "Debug", "Quiet")]
    [String]$LogLevel = "Quiet",
    [Switch]$Force,

    [String]$Preset = "slow",
    [Int]$CRF = 25,
    [Alias("vcodec")]
    [String]$VideoCodec = "libx265",
    [Alias("acodec")]
    [String]$AudioCodec = "copy",

    [Parameter(ValueFromRemainingArguments)]
    [String[]]$ArgumentList

  )

  begin {
    $Converter = (Get-Command -Type Application -TotalCount 1 -Name ffmpeg).Source
    $Analyzer = (Get-Command -Type Application -TotalCount 1 -Name ffprobe).Source
    $HTTP = [Net.HTTPListener]::new()
    $Index = 0
    $GetChildItem = @{
      Include = $Include
      Exclude = $Exclude
      Recurse = $Recurse
      Filter = $Filter
      File = $true
    }
    $GetChildItem[$PSCmdlet.ParameterSetName] = Get-Variable -Name $PSCmdlet.ParameterSetName -ValueOnly

    $Files = Get-ChildItem @GetChildItem | Sort-Object -Property FullName
    Set-Variable -Name Frame -Scope Script -Option Constant -Value @{
      Name = "CurrentFrame";
      Expression = { [UInt64]$_.Matches.Groups[1].Value }
    }
    Write-Verbose "Listening on localhost:6666"
    $HTTP.Prefixes.Add("http://localhost:6666/")
    $HTTP.Start()
  }

  process {
    foreach ($File in $Files) {

      $Output = Join-Path (New-TemporaryDirectory -Prefix "hevc.") $File.Name
      $Threads = [Math]::Clamp([Environment]::ProcessorCount, 0, 16)
      $Arguments = @(
        "-i"
        $File
        "-loglevel"
        $LogLevel -eq "Information" ? "info" : $LogLevel.ToLower()
        "-progress"
        "http://localhost:6666"
        "-threads"
        $Threads
        "-map"
        "0:v"
        "-map"
        "0:a?"
        "-map"
        "0:s?"
        "-map_metadata"
        0
        "-movflags"
        "use_metadata_tags"
        "-vtag"
        "hvc1"
        "-tune"
        "fastdecode"
        "-preset"
        $Preset
        "-crf"
        $CRF
        "-c:v"
        $VideoCodec
        "-c:a"
        $AudioCodec
        "-c:s"
        "copy"
        $ArgumentList
        "-x265-params"
        "log-level=error"
        $Output
      )

      $JobArguments = @{
        Name = $File.Name
        ArgumentList = $Arguments
        ScriptBlock = { & ${using:Converter} -hide_banner @args }
      }

      # Some string counting
      $Padding = $Files.Count.ToString().Length

      $Progress = @{
        PercentComplete = ($Index++ / $Files.Count) * 100
        Activity = "$($Index.ToString().PadLeft($Padding, ' '))/$($Files.Count)"
        Status = $File.FullName.Replace("$PWD/", "")
        Id = [Int]::MaxValue
      }

      Write-Progress @Progress

      if (-not $PSCmdlet.ShouldProcess($File, $Arguments)) { continue }

      Write-Verbose "Querying Input Video Codec"
      $Stream = & $Analyzer -hide_banner -output_format json -show_streams $File -select_streams v -loglevel quiet
              | ConvertFrom-Json
              | Select-Object -ExpandProperty Streams
      if ($Stream.codec_name -eq "hevc" -and (-not $Force)) {
        Write-Warning "No conversion will take place as $($File.Name) is already HEVC. Use -Force to encode anyways."
        continue
      }

      $MaxFrames = $Stream.nb_frames ?? 1
      $TotalDuration = [float]$Stream.duration
      Write-Verbose "Starting conversion of $File with ${Arguments}"
      $Job = Start-Job @JobArguments
      $Timer = [Diagnostics.StopWatch]::StartNew()
      $Spinners = @("🌎";"🌍";"🌏")
      $Spinner = 0
      $Lines = @()

      Write-Verbose "Waiting for first FFMpeg status update"
      $Context = $HTTP.GetContext()
      $Reader = [IO.StreamReader]::new($Context.Request.InputStream)
      while ($Job.State -eq "Running") {
        Start-Sleep -Milliseconds 500 # Maybe we're polling Reader too much
        do { $Lines += $Reader.Readline() } until($Lines -match "progress=")
        $Update = [PSCustomObject](ConvertFrom-StringData ($Lines -join "`n"))
        Write-Verbose $Update
        $Duration = try { ([TimeSpan]::FromTicks([Int]$Update.out_time_us * 10)).TotalSeconds } catch { 0 }
        $Speed = try { [float]($Update.Speed.Replace("x", "")) } catch { 1.0 }
        $TotalSize = try { "{0:F2} MB" -f ($Update.total_size / 1MB) } catch { $Update.total_size }
        $Status = "$TotalSize @ $($Update.bitrate) | $($File.Name)"

        $PercentComplete = $Update.Frame / $MaxFrames * 100
        if ($PercentComplete -gt 100) { $PercentComplete = -1 }

        $Progress = @{
          PercentComplete = $PercentComplete
          Activity = "$($Spinners[$Spinner]) $($Timer.Elasped)"
          SecondsRemaining = ($TotalDuration - $Duration) / $Speed
          Status = $Status
        }
        Write-Progress @Progress -Id $Index -ParentId ([Int]::MaxValue)
        if ($Update.Progress -eq "end") {
          break
        }
        $Spinner++
        $Spinner %= $Spinners.Count
        $Lines = @()
      }
      $Progress = @{
        SecondsRemaining = -1
        PercentComplete = 100
        Activity = "👽"
        Status = $File.FullName.Replace("$PWD/", "")
        ParentId = [Int]::MaxValue
        Id = $Index
      }
      Write-Progress @Progress
      $Context.Response.Close()
      $Timer.Stop()

      # TODO: This can just be the final status update from $Update
      Write-Verbose "$($Timer.Elapsed) | ${File}"
      Move-Item -Force -LiteralPath ${Output} -Destination ${File}
      Receive-Job -Job $Job -AutoRemoveJob -Wait
      Remove-Item -Force -Recurse (Split-Path -Parent $Output)
      Write-Progress @Progress -Complete
    }
  }

  clean {
    $HTTP.Stop()
    $HTTP.Close()
    $HTTP.Dispose()
  }
}
