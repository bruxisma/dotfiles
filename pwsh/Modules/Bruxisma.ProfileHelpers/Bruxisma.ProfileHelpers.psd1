@{
  ModuleVersion = '1.0.0'
  GUID = 'a40b0970-b534-44a2-a799-a6278fcbc0bf'
  Author = 'Bruxisma'
  CompanyName = ''
  Copyright = "© Izzy Muerte"
  Description = "Cmdlets to help quickly edit or update the user's environment"
  PowerShellVersion = '7.5.0'
  CompatiblePSEditions = @("Core")
  RootModule = "Bruxisma.ProfileHelpers"
  NestedModules = @("SSH.ps1";"CMake.ps1")
  FunctionsToExport = @(
    "Update-LocalProfile"
    "Update-Profile"
    "Update-File"
    "Edit-LocalProfile"
    "Edit-Profile"
    "Edit-File"
    "Test-Executable"
    "Clear-History"
  )
  CmdletsToExport = @()
  VariablesToExport = @()
  AliasesToExport = @()
  PrivateData = @{}
}
