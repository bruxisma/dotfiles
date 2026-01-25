using namespace System.Management.Automation;

Register-ArgumentCompleter -Native -CommandName winget -ScriptBlock {
  param($wordToComplete, $commandAst, $cursorPosition)
  [Console]::InputEncoding = [Console]::OutputEncoding = $OutputEncoding = [Text.UTF8Encoding]::new()
  $local:word = $wordToComplete.Replace('"', '""')
  $local:ast = $commandAst.ToString().Replace('"', '""')
  winget complete --word "${local:word}" --commandline "${local:ast}" --position $cursorPosition
  | ForEach-Object { [CompletionResult]::new($PSItem, $PSItem, "ParameterValue", $PSItem) }
}
