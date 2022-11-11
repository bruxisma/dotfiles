Import-Module -Force (Join-Path $PSScriptRoot Functions.ps1)
Import-Module -Force (Join-Path $PSScriptRoot Filters.ps1)

Import-Script -Platform Windows -Path Windows.ps1 -Force
Import-Script -Platform MacOS -Path MacOS.ps1 -Force
Import-Script -Platform Linux -Path Linux.ps1 -Force
Import-Script -Platform Posix -Path Posix.ps1 -Force

Import-Module -Force (Join-Path $PSScriptRoot Machine.ps1) -Scope Global

Set-Alias which Get-Command
Set-Alias edit Edit-File
Set-Alias info Get-Help

# Basic Readline options.
Set-PSReadlineOption -HistoryNoDuplicates -EditMode Windows -BellStyle None

# I like Windows Editing, but Ctrl+a and Ctrl+e from bash are forever burned
# into my soul
Set-PSReadlineKeyHandler -Key Ctrl+d -Function DeleteCharOrExit
Set-PSReadlineKeyHandler -Key Ctrl+a -Function BeginningOfLine
Set-PSReadlineKeyHandler -Key Ctrl+e -Function EndOfLine
Set-PSReadlineKeyHandler -Key Ctrl+k -ScriptBlock { Reset-Terminal }

Set-PSReadlineOption -Colors @{
  "ContinuationPrompt" = [ConsoleColor]::White;
  "Default" = [ConsoleColor]::White;
  "Parameter" = [ConsoleColor]::DarkMagenta;
  "Operator" = [ConsoleColor]::Magenta;
  "Type" = [ConsoleColor]::Blue;
}

function Prompt {
  $ESC = [char]27
  $GREEN = "$ESC[1;32m"
  $CYAN = "$ESC[1;36m"
  $RESET = "$ESC[0m"
  "${GREEN}[$(Get-UserName)@$(Get-HostName)]${RESET}:${CYAN}$(Get-PromptPath)${RESET}$ "
}
