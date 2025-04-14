@{
  ModuleVersion = '1.0.0'
  GUID = 'a40b0970-b534-44a2-a799-a6278fcbc0bf'
  Author = 'Bruxisma'
  CompanyName = ''
  Description = "Cmdlets to help quickly edit or update the user's environment"
  PowerShellVersion = '7.5.0'
  CompatiblePSEditions = @("Core")
  RootModule = "Bruxisma.ProfileHelpers"
  FunctionsToExport = @(
    "Update-LocalProfile"
    "Update-Profile"
    "Update-File"
    "Edit-LocalProfile"
    "Edit-Profile"
    "Edit-File"
  )
  CmdletsToExport = @()
  VariablesToExport = @()
  AliasesToExport = @()
  PrivateData = @{ PSData = @{} }
}
