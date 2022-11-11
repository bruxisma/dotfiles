# TODO: Once Get-DNSClient is available under Powershell, use that instead
function Get-HostName { [Environment]::UserDomainName.ToLower() }
function Get-UserName { [Environment]::UserName.ToLower() }

function Reload-Profile { . $PROFILE.CurrentUserAllHosts }
function Edit-Profile { Edit-File $PROFILE.CurrentUserAllHosts }
function Edit-Machine { Edit-File $PSScriptRoot/Machine.ps1 }

function Import-Script {
  [CmdletBinding()]
  param(
    [ValidateSet("Windows", "MacOS", "Linux", "Posix")]
    [String]
    $Platform,
    [Parameter(Mandatory=$True)]
    [String]
    $Path,
    [Switch]
    $Force = $False
  )

  $valid = switch ($Platform) {
    "Windows" { $IsWindows }
    "MacOS" { $IsMacOS }
    "Linux" { $IsLinux }
    "Posix" { -not $IsWindows }
  }
  if (-not $valid) { return }
  Import-Module (Join-Path $PSScriptRoot $Path) -Force:$Force -Scope Global
}

function Edit-File([String]$Path) { & $env:EDITOR $Path }
function Test-File([String]$Path) { Test-Path -PathType Leaf $Path }

function Clear-Terminal {
  $position = $HOST.UI.RawUI.CursorPosition
  1..$HOST.UI.RawUI.WindowSize.Height | %{ Write-Host `n }
  $HOST.UI.RawUI.CursorPosition = $position
}

function Reset-Terminal { Clear-Host }

function Test-AddPath ([String]$Path) {
  if (Test-File $Path) { $Path = [IO.Path]::GetDirectoryName($Path) }
  if (-not (Test-Path $Path)) { return }
  if ($env:PATH.Contains($Path)) { return }
  return $Path
}

function Append-Path ([String]$Path) {
  $separator = [IO.Path]::PathSeparator
  $Path = Test-AddPath $Path
  if (-not $Path) { return }
  if (-not $env:PATH.EndsWith($separator)) { $Path = $Path.Insert(0, $separator) }
  $env:PATH += $Path
}

function Prepend-Path ([String]$Path) {
  $separator = [IO.Path]::PathSeparator
  $Path = Test-AddPath $Path
  if (-not $Path) { return }
  $env:PATH.Insert(0, ('{0}{1}' -f $Path, $separator))
}

function Prepend-To ([String]$Var, [String]$Path) {
  if (-not $Var) { return }
  $separator = [IO.Path]::PathSeparator
  if (Test-File $Path) { $Path = [IO.Path]::GetDirectoryName($Path) }
  if (-not (Test-Path $Path)) { return }
  if (-not (Test-Path Env:$Var)) {
    New-Item -Path Env: -Name $Var -Value "$($Path)" | Out-Null
    return
  }
  if ((Get-Item Env:$Var).Value.Contains($Path)) { return }
  (Get-Item Env:$Var).Insert(0, "$($Path)$($separator)")
}

function Append-To ([String]$Var, [String]$Path) {
  if (-not $Var) { return }
  $separator = [IO.Path]::PathSeparator
  if (Test-File $Path) { $Path = [IO.Path]::GetDirectoryName($Path) }
  if (-not (Test-Path $Path)) { return }
  if (-not (Test-Path Env:$Var)) {
    New-Item -Path Env: -Name $Var -Value "$($Path)" | Out-Null
    return
  }
  if ((Get-Item Env:$Var).Value.Contains($Path)) { return }
  if (-not (Get-Item Env:$Var).Value.EndsWith($separator)) {
    $Path = $Path.Insert(0, $separator)
  }
  [Environment]::SetEnvironmentVariable($Var, "$((Get-Item Env:$Var).Value)$($Path)")
}

function Get-PromptPath {
  Get-Location | Convert-Path | Replace-Home | Replace-Root | Replace-Sep
}
