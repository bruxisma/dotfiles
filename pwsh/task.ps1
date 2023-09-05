Register-ArgumentCompleter -CommandName 'task' -Native -ScriptBlock {
  param($wordToComplete)

  $(task --json --list-all)
  | ConvertFrom-Json -NoEnumerate
  | ForEach-Object { $_.tasks }
  | ForEach-Object { $_.name }
  | Sort-Object -Unique
  | Where-Object { $_ -like "${wordToComplete}*" }
}
