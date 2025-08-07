using namespace System.Management.Automation.Language;
using namespace System.Management.Automation;

function Read-SSHConfig {
  [CmdletBinding()]
  param(
  [ValidateNotNullOrEmpty()]
  [Parameter(Mandatory=$true)]
  [String]$Path)
  (Select-String -Path ${Path} -Pattern '^Host\s+(.+)$'
  | ForEach-Object { $_.Matches.Groups[1].Value -split ' ' }
  | Select-String -Pattern '[*!?]' -NotMatch) &&
  (Select-String -Path ${Path} -Pattern '^Include (.+)$'
  | ForEach-Object { Read-SSHConfig -Path $_.Matches.Groups[1].Value })
}

Register-ArgumentCompleter -CommandName "ssh", "scp" -Native -ScriptBlock {
  param($wordToComplete)
  Read-SSHConfig -Path "${HOME}/.ssh/config"
  | Sort-Object -Unique
  | Where-Object { $_ -like "${wordToComplete}*" }
}
