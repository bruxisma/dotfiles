[CmdletBinding(SupportsShouldProcess)]
param()

$modules = @(
  "Microsoft.PowerShell.SecretManagement"
  "Microsoft.PowerShell.SecretStore"
  "Microsoft.PowerShell.Crescendo"
  "oh-my-posh"
  "Atmosphere"
  "PSScriptAnalyzer"
)

foreach ($module in $modules) {
  if ($PSCmdlet.ShouldProcess($module, "Install-Module")) {
    Install-Module $module
  }
}
