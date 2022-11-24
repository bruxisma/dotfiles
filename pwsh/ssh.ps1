function script:Read-SSHConfig {
  [CmdletBinding()]
  param(
    [ValidateNotNullOrEmpty()]
    [Parameter(Mandatory=$true)]
    [String]$Path)
  Select-String -Path ${Path} -Pattern '^Host (.+)$'
  | ForEach-Object { $_.Matches.Groups[1].Value -split ' ' }
  | Select-String -Pattern '[*!?]' -NotMatch
}

Register-ArgumentCompleter -CommandName 'ssh', 'scp' -Native -ScriptBlock {
  param($wordToComplete)

  $hosts = Read-SSHConfig -Path "${HOME}/.ssh/config" &&
           Select-String -Path "${HOME}/.ssh/config" -Pattern '^Include (.+)$'
           | ForEach-Object { Read-SSHConfig -Path $_.Matches.Groups[1].Value }
  $hosts
  | Sort-Object -Unique
  | Where-Object { $_ -like "${wordToComplete}*" }
}
