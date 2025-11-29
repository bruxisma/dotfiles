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
