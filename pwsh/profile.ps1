if (-not $IsWindows) { Import-Module -Force (Join-Path $PSScriptRoot Posix.ps1) }
if ($IsWindows) { Import-Module -Force (Join-Path $PSScriptRoot Windows.ps1) }
if ($IsMacOS) { Import-Module -Force (Join-Path $PSScriptRoot MacOS.ps1) }
if ($IsLinux) { Import-Module -Force (Join-Path $PSScriptRoot Linux.ps1) }
Import-Module -Force (Join-Path $PSScriptRoot Machine.ps1) -Scope Global
Import-Module -Force (Join-Path $PSScriptRoot Support.ps1) -Scope Local
Import-Module -Force (Join-Path $PSScriptRoot rustup.ps1) -Scope Global

$readline = Import-PowerShellDataFile (Join-Path $PSScriptRoot readline.psd1)
Set-PSReadlineOption @readline
Remove-Variable readline

Set-EnvironmentVariable -Name FZF_DEFAULT_COMMAND -Value "fd --type f"

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
