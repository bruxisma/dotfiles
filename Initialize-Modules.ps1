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

Set-PSRepository -Name PSGallery -InstallationPolicy Trusted

foreach ($module in $modules) {
  if ($PSCmdlet.ShouldProcess($module, "Install-Module")) {
    Install-Module $module
  }
}
