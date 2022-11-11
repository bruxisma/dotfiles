if (-not $IsWindows) { Import-Module -Force (Join-Path $PSScriptRoot Posix.ps1) }
if ($IsWindows) { Import-Module -Force (Join-Path $PSScriptRoot Windows.ps1) }
if ($IsMacOS) { Import-Module -Force (Join-Path $PSScriptRoot MacOS.ps1) }
if ($IsLinux) { Import-Module -Force (Join-Path $PSScriptRoot Linux.ps1) }

$ScriptsPath = Join-Path $PSScriptRoot Scripts

Import-Module (Join-Path $PSScriptRoot Support.ps1) -Force -Scope Local
Import-Module (Join-Path $PSScriptRoot Machine.ps1) -Force -Global

Import-Completions gh completion --shell powershell
Import-Completions pack completion --shell powershell
Import-Completions just --completions powershell
Import-Completions rustup completions powershell
Import-Completions op completion powershell

$readline = Import-PowerShellDataFile (Join-Path $PSScriptRoot readline.psd1)
Set-PSReadlineOption @readline
Remove-Variable readline

Set-EnvironmentVariable -Name FZF_DEFAULT_COMMAND -Value "fd --type f"
Set-EnvironmentVariable -Name CMAKE_GENERATOR -Value Ninja
Set-EnvironmentVariable -Name DOCKER_BUILDKIT -Value 1
Set-EnvironmentVariable -Name LESSCHARSET -Value "utf-8"

Set-PSReadlineKeyHandler -Chord Ctrl+d -Function DeleteCharOrExit
Set-PSReadlineKeyHandler -Chord Ctrl+a -Function BeginningOfLine
Set-PSReadlineKeyHandler -Chord Ctrl+e -Function EndOfLine

Set-Alias reload Update-Profile
Set-Alias which Get-Command
Set-Alias edit Edit-File
Set-Alias info Get-Help

function Prompt {
  $GREEN = "`e[1;32m"
  $CYAN = "`e[1;36m"
  $RESET = "`e[0m"
  "${GREEN}[$(Get-UserName)@$(Get-HostName)]${RESET}:${CYAN}$(Get-PromptPath)${RESET}$ "
}
