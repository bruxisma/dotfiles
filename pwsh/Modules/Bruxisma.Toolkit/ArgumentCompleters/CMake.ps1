using namespace System.Management.Automation.Language;
using namespace System.Management.Automation;

$script:display = @{ Name = "Display"; Expression = { $_.Groups[$_.Groups[2].Success + 1].Value } }
$script:name = @{ Name = "Name"; Expression = { $_.Groups[1].Value } }


# NOTE: Reading directly from the files instead of letting CMake do it for us
# would make this closer to what we do with SSH, but also reduce overhead since
# we'd be reading JSON without launching an executable as overhead.
function Read-CMakePresets {
  [CmdletBinding()]
  param(
    [ValidateNotNullOrEmpty()]
    [Parameter(Mandatory=$true)]
    [String]$Type,
    [ValidateNotNullOrEmpty()]
    [Parameter(Mandatory=$true)]
    [String]$Path
  )
  cmake --list-presets=${Type} ${Path}
  | Select-String -Pattern '^\s+"(.+)"(?:\s-\s)?(.+)?$'
  | Select-Object -ExpandProperty Matches
  | Select-Object -Property ${script:name},${script:display}
}

function Get-CMakePresetType {
  [CmdletBinding()]
  param([CommandAst]$commandAst)
  switch (${commandAst}.GetCommandName()) {
    "cpack" { "package" }
    "ctest" { "test" }
    default {
      switch (${command}.ToString()) {
        { $_.Contains("--workflow") } { "workflow" }
        { $_.Contains("--build") } { "build" }
        default { "configure" }
      }
    }
  }
}

# TODO: Need to handle `--workflow <preset>` as an option
Register-ArgumentCompleter -CommandName "cmake", "ctest", "cpack" -Native -ScriptBlock {
  param($wordToComplete, $commandAst)

  $type = Get-CMakePresetType ${commandAst}

  if (${wordToComplete} -match "--preset=?") {
    Read-CMakePresets -Type ${type} -Path "${PWD}"
    | ForEach-Object { [CompletionResult]::new("--preset=$($_.Name)", $_.Display, "ParameterValue", $_.Name) }
  }
}
