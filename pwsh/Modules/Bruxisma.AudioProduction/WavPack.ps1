function ConvertTo-WavPack {
  [CmdletBinding()]
  param(
    [Parameter(Mandatory, Position = 0)]
    [ValidateNotNullOrEmpty()]
    [String]$LiteralPath = $PWD,

    [String]$Destination,

    [Parameter(Position = 1)]
    [String]$Filter,
    [String[]]$Include,
    [String[]]$Exclude,
    [Switch]$Recurse,
    [Switch]$Force,
    [Switch]$AutoRemove,
    [Int]$Threads
  )

  begin {
    $Threads = $Threads ?? 4
    $GCI = @{
      LiteralPath = $LiteralPath
      Include = $Include
      Exclude = $Exclude
      Filter = $Filter
      Recurse = $Recurse
    }
    $Files = Get-ChildItem @GCI -File
    $Idx = 0
  }

  process {
    foreach ($File in $Files) {
      $Target = [String]::IsNullOrEmpty($Destination) ? "$($File.FullName).wv" : $Destination
      Write-Progress -Activity "Compressing" -Status $File.Name -PercentComplete ($Idx++ / $Files.Length * 100)
      if ($Force -and (Test-Path -LiteralPath "${Target}" -PathType Leaf)) {
        Remove-Item -LiteralPath "${Target}" -Force
      }
      if ($File.Length) {
        wavpack --threads=${Threads} -x6 -hh -z -v -q "${File}" "${Target}"
        (Get-Item -LiteralPath ${Target}).LastWriteTime = $File.LastWriteTime
        if ($? -and $AutoRemove) { Remove-Item -LiteralPath $File }
      }
    }
  }

  end { Write-Progress -Activity "Compressing" -Completed }
}

function ConvertFrom-WavPack {
  [CmdletBinding()]
  param(
    [Parameter(Mandatory, Position = 0)]
    [ValidateNotNullOrEmpty()]
    [String]$LiteralPath = $PWD,

    [String]$Destination,

    [Parameter(Position = 1)]
    [String]$Filter,
    [String[]]$Include,
    [String[]]$Exclude,
    [Switch]$Recurse,
    [Switch]$Force,
    [Switch]$AutoRemove
  )
  begin {
    $GCI = @{
      LiteralPath = $LiteralPath
      Include = $Include
      Exclude = $Exclude
      Filter = $Filter
      Recurse = $Recurse
    }
    $Files = Get-ChildItem @GCI -File
    $Idx = 0
  }

  process {
    foreach ($File in $Files) {
      $Target = [String]::IsNullOrEmpty($Destination) ? ([IO.Path]::GetFileNameWithoutExtension($File.FullName)) : $Destination
      Write-Progress -Activity "Decompressing" -Status $File.name -PercentComplete ($Idx++ / $Files.Length * 100)
      if ($Force -and (Test-Path -LiteralPath "${Target}" -PathType Leaf)) {
        Remove-Item -LiteralPath "${Target}" -Force
      }
      if ($File.Length) {
        wvunpack --threads=4 -z -q "${File}" "${Target}"
        (Get-Item -LiteralPath ${Target}).LastWriteTime = $File.LastWriteTime
      }
      if ($? -and $AutoRemove) { Remove-Item -LiteralPath $File }
    }
  }

  end { Write-Progress -Activity "Decompressing" -Completed }
}


