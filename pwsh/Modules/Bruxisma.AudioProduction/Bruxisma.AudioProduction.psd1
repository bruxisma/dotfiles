@{
  ModuleVersion = '1.0.0'
  GUID = '8643b580-72e5-4f52-bb4d-0f0acaf3e2b5'
  Author = 'Bruxisma'
  Copyright = '© Izzy Muerte.'
  Description = 'Common Commands for Managing My Setup'
  PowerShellVersion = '7.5'
  CompatiblePSEditions = @('Core')
  RootModule = "Bruxisma.AudioProduction"
  NestedModules = @(
    "DecentSampler.ps1"
    "WavPack.ps1"
    "Ableton.ps1"
    "Samples.ps1"
    "Serum.ps1"
    "FLAC.ps1"
  )
  FunctionsToExport = @(
    "Install-SerumPack"
    "Find-AbletonUserLibrary"
    "Expand-AbletonGroup"
    "Compress-AbletonGroup"
    "ConvertTo-WavPack"
    "ConvertFrom-WavPack"
    "ConvertTo-SamplePack"
    "ConvertTo-FLAC"
  )
  CmdletsToExport = @()
  VariablesToExport = '*'
  AliasesToExport = @()
  PrivateData = @{}
}
