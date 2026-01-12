function Find-AbletonUserLibrary {
  [CmdletBinding()]
  param([Version]$Version)

  $Preferences = $IsWindows ? @("Preferences") : @()
  $Paths = $IsWindows ? @($env:APPDATA) : @($HOME, "Library", "Preferences")

  $Live = Get-ChildItem -LiteralPath (Join-Path @Paths Ableton) -Directory -Exclude "*Reports"
        | Sort-Object -Property Name
        | Select-Object -Last 1

  # TODO: Handle `$Version`
  $Library = [XML](Get-Content (Join-Path $Live @Preferences Library.cfg))
  $Path = $Library.Ableton.ContentLibrary.UserLibrary.LibraryProject.ProjectPath.Value
  if ($Path -eq $null) { return $Path }
  Get-Item (Join-Path $Path "User Library")
}

function Expand-AbletonGroup {
  [CmdletBinding()]
  param(
    [Parameter(Mandatory, Position=0)]
    [ValidateNotNullOrEmpty()]
    [String]$LiteralPath,
    [String]$DestinationPath
  )
  $LiteralPath = Get-Item -LiteralPath $LiteralPath
  if ([String]::IsNullOrEmpty($DestinationPath)) {
    $DestinationPath = [IO.Path]::GetFileNameWithoutExtension($LiteralPath)
  }
  zstd --decompress --format=gzip $LiteralPath -o $DestinationPath
  Get-Item -LiteralPath $DestinationPath
}

function Compress-AbletonGroup {
  [CmdletBinding()]
  param(
    [Parameter(Mandatory, Position=0)]
    [ValidateNotNullOrEmpty()]
    [String]$LiteralPath,
    [String]$DestinationPath,
    [Switch]$Force
  )
  $ArgumentList = @(
    "--format=gzip"
    "--ultra"
    "-T0"
    "-22"
  )
  if ($Force) { $ArgumentList += "--force" }
  $LiteralPath = Get-Item -LiteralPath $LiteralPath
  if ([String]::IsNullOrEmpty($DestinationPath)) {
    $DestinationPath = "$LiteralPath.adg"
  }
  zstd @ArgumentList $LiteralPath -o $DestinationPath
  Get-Item -LiteralPath $DestinationPath
}
