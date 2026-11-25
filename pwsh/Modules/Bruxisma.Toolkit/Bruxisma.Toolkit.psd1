@{
  ModuleVersion = '1.0.0'
  GUID = 'a40b0970-b534-44a2-a799-a6278fcbc0bf'
  Author = 'Bruxisma'
  CompanyName = ''
  Copyright = "© Izzy Muerte"
  Description = "My Personal Toolkit"
  PowerShellVersion = '7.7.0'
  CompatiblePSEditions = @("Core")
  RootModule = "Bruxisma.Toolkit"
  NestedModules = @(
    "ArgumentCompleters/SSH.ps1"
    "ArgumentCompleters/CMake.ps1"
    "ArgumentCompleters/WinGet.ps1"

    "PowerShell.ps1"

    "Compression.ps1"
    "Optimize.ps1"
    "Download.ps1"
    "Convert.ps1"
    "Media.ps1"
  )
  FunctionsToExport = @(
    "Optimize-PNG"

    "Compress-Item"
    "Expand-Item"

    "Get-Favicon"

    "ConvertTo-HEVC"

    "Search-Media"
    "Select-Media"
    "Save-Video"

    "Update-PowerShell"


    "Update-LocalProfile"
    "Update-Profile"
    "Update-File"
    "Edit-LocalProfile"
    "Edit-Profile"
    "Edit-File"
    "Test-Executable"
    "Clear-History"
    "Update-Timestamps"
  )
  CmdletsToExport = @()
  VariablesToExport = @()
  AliasesToExport = @()
  PrivateData = @{}
}
