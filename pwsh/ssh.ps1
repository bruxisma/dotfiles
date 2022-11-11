# This is an argument completer script
using namespace System.Management.Automation

Register-ArgumentCompleter -Native -CommandName "ssh" -ScriptBlock {
  param($word, $ast, $position)
  # $ast and $position are currently unused
  Get-ChildItem -Path $HOME/.ssh/config,$HOME/.ssh/config.d/* -Recurse -File `
  | Select-String -Pattern "^Host\s+([^*]+)$" `
  | ForEach-Object { $_.Line -replace "^Host\s+", "" } `
  | Where-Object { $_ -like "*$word*" }
  | ForEach-Object { [CompletionResult]::New($_, $_, [CompletionResultType]::ParameterName, "SSH Host") }
}
