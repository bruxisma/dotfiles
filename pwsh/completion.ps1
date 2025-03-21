using namespace System.Management.Automation.Language;
using namespace System.Management.Automation;

$script:display = @{ Name = "Display"; Expression = { $_.Groups[$_.Groups[2].Success + 1].Value } }
$script:name = @{ Name = "Name"; Expression = { $_.Groups[1].Value } }

function script:Read-SSHConfig {
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


# TODO: Read from the files directly instead of letting CMake do it for us.
#       This would make it closer to how Read-SSHConfig works
function script:Read-CMakePresets {
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

function script:Get-CMakePresetType {
  [CmdletBinding()]
  param([CommandAst]$commandAst)
  switch (${commandAst}.GetCommandName()) {
    "cpack" { "package"}
    "ctest" { "test" }
    default {
      switch (${commandAst}.ToString()) {
        { $_.Contains("--workflow") } { "workflow" }
        { $_.Contains("--build") } { "build" }
        default { "configure" }
      }
    }
  }
}

Register-ArgumentCompleter -CommandName "cmake", "ctest", "cpack" -Native -ScriptBlock {
  param($wordToComplete, $commandAst)

  $type = Get-CMakePresetType ${commandAst}

  if (${wordToComplete} -match "--preset=?") {
    Read-CMakePresets -Type ${type} -Path "${PWD}"
    | ForEach-Object { [CompletionResult]::new("--preset=$($_.Name)", $_.Display, "ParameterValue", $_.Name) }
  }
}

Register-ArgumentCompleter -CommandName "ssh", "scp" -Native -ScriptBlock {
  param($wordToComplete)
  Read-SSHConfig -Path "${HOME}/.ssh/config"
  | Sort-Object -Unique
  | Where-Object { $_ -like "${wordToComplete}*" }
}
