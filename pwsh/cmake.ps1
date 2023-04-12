using namespace System.Management.Automation

function script:Read-CMakePresets {
  [CmdletBinding()]
  param(
    [ValidateNotNullOrEmpty()]
    [Parameter(Mandatory=$true)]
    [String]$Type,
    [ValidateNotNullOrEmpty()]
    [Parameter(Mandatory=$true)]
    [String]$Path)
  cmake --list-presets=${Type} ${Path}
  | Select-String -Pattern '^\s+"(.+)"(?:\s-\s)?(.+)?$'
  | ForEach-Object {
    $name = $_.Matches.Groups[1].Value
    $display = if ($_.Matches.Groups[2].Success) {
      $_.Matches.Groups[2].Value
    } else { ${name} }
    [CompletionResult]::new(
      "--preset=${name}",
      ${display},
      "ParameterValue",
      ${name})
  }
}

Register-ArgumentCompleter -CommandName 'cmake','ctest','cpack' -Native -ScriptBlock {
  param($wordToComplete, $commandAst, $cursorPosition)
  $command = ${commandAst}.ToString()

  $type = if (${command}.Contains("--build")) {
    "build"
  } elseif (${command}.Contains("--workflow")) {
    "workflow"
  } elseif (${commandAst}.GetCommandName() -eq "ctest") {
    "test"
  } elseif (${commandAst}.GetCommandName() -eq "cpack") {
    "package"
  } else {
    "configure"
  }

  if (${wordToComplete} -match "--preset=?") {
    Read-CMakePresets -Type ${type} -Path "${PWD}"
  }
}
