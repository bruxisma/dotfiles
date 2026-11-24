using namespace System.IO
using namespace System.Web

<#
.SYNOPSIS
Search a media container (image, audio, video) for various metadata
information.

.DESCRIPTION
This Cmdlet uses ffprobe to query information stored within the provided Media
container, and can return any of the various sections that ffprobe is able to
discern. Additionally, this information is converted to PSObjects, allowing it
to be wrapped for more targeted selection, as found in wrapper cmdlets like
Select-MediaContainerFormat and more.

.LINK
https://ffmpeg.org/ffprobe.html

.COMPONENT
Media
#>
function Search-Media {
  [CmdletBinding(DefaultParameterSetName = "Path")]
  param(
    [Parameter(Mandatory, Position = 0, ValueFromPipeline, ParameterSetName = "Path")]
    [String[]]$Path,

    [Parameter(Mandatory, Position = 0, ParameterSetName = "LiteralPath")]
    [ValidateNotNullOrEmpty()]
    [String[]]$LiteralPath,

    [ValidateSet("JSON", "XML", "CSV", "INI", "Default", "Compact", "Flat", "PSObject")]
    [String]$OutputFormat = "PSObject",

    [ValidateSet("Fatal", "Error", "Warning", "Information", "Verbose", "Debug", "Quiet")]
    [String]$LogLevel = "Quiet",

    [Parameter(Position = 1)]
    [String]$Filter,
    [String[]]$Include,
    [String[]]$Exclude,
    [Switch]$Recurse,

    [Switch]$ContainerFormat,
    [Switch]$PixelFormat,

    [Switch]$StreamGroups,
    [Switch]$Streams = $true,

    [Switch]$Chapters,
    [Switch]$Programs,

    [Parameter(ValueFromRemainingArguments)]
    [String[]]$ArgumentList
  )

  begin {
    $Analyzer = (Get-Command -Type Application -TotalCount 1 -Name ffprobe).Source
    $GetChildItem = @{
      Filter = $Filter
      Include = $Include
      Exclude = $Exclude
      Recurse = $Recurse
      File = $true
    }
    $GetChildItem[$PSCmdlet.ParameterSetName] = Get-Variable -Name $PSCmdlet.ParameterSetName -ValueOnly
    $Files = Get-ChildItem @GetChildItem

    $Arguments = @(
      "-loglevel"
      $LogLevel -eq "Information" ? "info" : $LogLevel.ToLower()
      "-output_format"
      $OutputFormat -eq "PSObject" ? "json" : $OutputFormat.ToLower()

      $ContainerFormat ? "-show_format" : $null
      $PixelFormat ? "-show_pixel_format" : $null

      $StreamGroups ? "-show_stream_groups" : $null
      $Streams ? "-show_streams" : $null

      $Chapters ? "-show_chapters" : $null
      $Programs ? "-show_programs" : $null

      $ArgumentList
    )
  }

  process {
    foreach ($File in $Files) {
      Write-Verbose "& $Analyzer -hide_banner $Arguments $File"
      $output = & $Analyzer -hide_banner @Arguments $File
      switch ($OutputFormat) {
        "PSObject" { $output | ConvertFrom-Json }
        "XML" { [xml]$output }
        default { $output }
      }
    }
  }
}

<#
.FORWARDHELPTARGETNAME Search-MediaContainer
.FORWARDHELPCATEGORY Function
#>
function Select-Media {
  [CmdletBinding(DefaultParameterSetName = "Path")]
  param(
    [Parameter(Mandatory, Position = 0, ValueFromPipeline, ParameterSetName = "Path")]
    [String[]]$Path,

    [Parameter(Mandatory, Position = 0, ParameterSetName = "LiteralPath")]
    [ValidateNotNullOrEmpty()]
    [String[]]$LiteralPath,

    [ValidateSet("Fatal", "Error", "Warning", "Information", "Verbose", "Debug", "Quiet")]
    [String]$LogLevel = "Quiet",

    [Parameter(Position = 1)]
    [String]$Filter,
    [String[]]$Include,
    [String[]]$Exclude,
    [Switch]$Recurse,

    [Parameter(ValueFromRemainingArguments)]
    [String[]]$ArgumentList
  )

  begin {
    $ScriptBlock = {
      Search-Media -Streams @PSBoundParameters
      | Select-Object -ExpandProperty Streams
    }
    $Pipeline = $ScriptBlock.GetSteppablePipeline()
    $Pipeline.Begin($PSCmdlet)
  }
  process {
    $Pipeline.Process($_)
  }
  end { $Pipeline.End() }
}

# TODO: Support pipeline input
# TODO: Support passing multiple URLs
# TODO: Support passing a Playlist as a separate ParameterSet
# TODO: Support --batch-file and --archive-log
function Save-Video {
  [CmdletBinding(SupportsShouldProcess)]
  param(
    [Parameter(Mandatory, Position = 0)]
    [ValidateNotNullOrEmpty()]
    [URI]$URL,

    [ValidateNotNullOrEmpty()]
    [String]$Destination = $PWD,

    [String]$Name,

    # TODO: If the URL is of a specific domain (e.g., tiktok) we might need to select a better format
    [ValidateNotNullOrEmpty()]
    [String]$Format = "bestvideo+bestaudio",

    [ValidateNotNullOrEmpty()]
    [String]$Template = '%(title)s.%(ext)s',

    [ValidateNotNull()]
    [String]$RemuxVideo = "",

    [ValidateNotNull()]
    [String]$MergeOutputFormat = "",


    [Switch]$Extract,
    [Switch]$Force,

    [ValidateNotNull()]
    [Int]$SleepInterval = 1,

    [ValidateNotNull()]
    [Int]$SleepRequests = 1,

    [Parameter(ValueFromRemainingArguments)]
    [String[]]$ArgumentList
  )

  $Downloader = (Get-Command -Type Application -TotalCount 1 -Name yt-dlp).Source

  if ([String]::IsNullOrWhitespace($Name)) {
    $Name = switch ($URL.Host) {
      { $_ -in ${script:YouTube} } { [HTTPUtility]::ParseQueryString($URL.Query)["v"] }
      { $_ -in ${script:Instagram} } { Split-Path $URL.LocalPath -Leaf }
      { $_ -in ${script:TikTok} } { $URL.AbsolutePath.Trim("/") }
      { $Extract } { yt-dlp --simulate --print '%(title)s' ${URL} }
      default { $URL }
    }
  }

  if (-not $PSCmdlet.ShouldProcess($URL, "Download ${Name}")) { return }

  $Arguments = @(
    ${Force} ? "--force-overwrites" : "--no-force-overwrites"
    "--add-metadata"
    "--embed-subs"
    "--embed-thumbnail"
    "--embed-chapters"
    "--windows-filenames"
    "--mtime"
    "--xattrs"
  )
  if ($RemuxVideo) { $Arguments += @("--remux-video", ${RemuxVideo}) }
  if ($MergeOutputFormat) { $Arguments += @("--merge-output-format", ${MergeOutputFormat}) }
  $Arguments += $ArgumentList

  $Workspace = New-TemporaryDirectory

  $Job = Start-Job -Name $Name -ArgumentList $Arguments -ScriptBlock {
    Write-Output @{
      Arguments = ${using:Arguments}
      Downloader = ${using:Downloader}
      Destination = ${using:Destination}
      Workspace = ${using:Workspace}
      Template = ${using:Template}
      Format = ${using:Format}
      URL = ${using:URL}
    }
    & ${using:Downloader} `
      --sleep-interval ${using:SleepInterval} `
      --sleep-requests ${using:SleepRequests} `
      --paths "home:${using:Destination}" `
      --paths "temp:${using:Workspace}"   `
      --output ${using:Template}   `
      --format ${using:Format}     `
      --sub-langs "en.*"           `
      @args                        `
      "${using:URL}"
  }
  $EventHandler = @{
    SupportEvent = $true
    InputObject = $Job
    EventName = "StateChanged"
    MessageData = @{
      Workspace = $Workspace
      URL = $URL
      ID = $Job.Id
    }
    # TODO: We need to handle state change information appropriately
    Action = {
      Unregister-Event $EventSubscriber.SourceIdentifier
      Remove-Job $EventSubscriber.SourceIdentifier
      #Remove-Job -Id $Event.MessageData.ID

      Remove-Item -Recurse -Force $Event.MessageData.Workspace
    }
  }
  Register-ObjectEvent @EventHandler
  $Job
}

Set-Variable -Name "YouTube" -Value @("www.youtube.com", "youtube.com", "youtu.be") -Scope Script -Option Constant
Set-Variable -Name "Instagram" -value @("www.instagram.com", "instagram.com") -Scope Script -Option Constant
Set-Variable -Name "TikTok" -value @("www.tiktok.com", "tiktok.com") -Scope Script -Option Constant
