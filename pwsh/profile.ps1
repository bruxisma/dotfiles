using namespace System.Collections.Generic
using namespace System.Text
using namespace System.IO

<# Bootstrap #>
Set-Variable -Scope Private -Option ReadOnly -Force -Name Separator -Value ([Path]::PathSeparator)
Set-Variable -Scope Private -Name Paths -Value ([List[String]]::new((${env:PATH} -split ${private:Separator})))

[Console]::OutputEncoding = [Encoding]::UTF8

Import-Module Bruxisma.ProfileHelpers

# Explicitly set XDG fallback values

${env:XDG_CONFIG_HOME} ??= $(Join-Path ${HOME} ".config")
${env:XDG_CACHE_HOME} ??= $(Join-Path ${HOME} ".cache")
${env:XDG_STATE_HOME} ??= $(Join-Path ${HOME} ".local" "share" "state")
${env:XDG_DATA_HOME} ??= $(Join-Path ${HOME} ".local" "share")

<# Script Local Variables #>
Set-Variable -Scope Script -Name OhMyPoshConfig -Value (Join-Path ${env:XDG_CONFIG_HOME} oh-my-posh config.yml)
Set-Variable -Scope Script -Option ReadOnly -Force -Name ReadlineConfig -Value @{
  HistoryNoDuplicates = $true
  EditMode = "Windows"
  BellStyle = "None"
  PredictionSource = "HistoryAndPlugin"
  PredictionViewStyle = "InlineView"
  PromptText = "$ "
  Colors = @{
    ContinuationPrompt = "White"
    Default = "White"
    Parameter = "DarkMagenta"
    Operator = "Magenta"
    Type = "Blue"
  }
}

<# Aliases #>
if (!$IsWindows -and (Test-Executable eza)) {
  Set-Alias ls eza
}

if ($IsWindows) {
  Set-Alias touch Update-File
  Set-Alias open Start-Process
}

Set-Alias which Get-Command
Set-Alias edit Edit-File

<# Common Environment Variables #>

# TODO: Set these as global environment variables *forever*
# For Windows this is done by writing to `HKCU:Environment`
#  Maybe a job for DSC 3.0?
# For macOS this is done via `launctl setenv` but it has to be run on login
#  (different commands for system Path)
#  This should be done via a LaunchAgent.plist file
#  Could also be a DSC resource in the future?
# For Linux: Kind of up in the air due to systemd, pam.d, and dogshit
# documentation. There is a solution here I'm sure.
# Some notes from the Arch Linux wiki:
# https://wiki.archlinux.org/title/Environment_variables#Per_Xorg_session

<# Environment Variables #>
${private:Paths} += @(
  Join-Path ${HOME} .cargo bin
)

if ($IsWindows) {
  ${private:Paths} += @()
}

if ($IsMacOS) {
  ${private:Paths} += @("/usr/local/share/dotnet")
}

Set-Item -Path Env:PATH -Value $(${private:Paths} -join ${private:Separator})
Set-Item -Path Env:EDITOR -Value (Test-Executable "nvim").Source

if (-not (Test-Path Env:CCACHE_DIR -PathType Leaf)) {
  Set-Item -Path Env:CCACHE_DIR -Value $(Join-Path ${env:XDG_CACHE_HOME} "ccache")
}

<# General Values #>
Set-Item -Path Env:CMAKE_GENERATOR -Value "Ninja Multi-Config"
Set-Item -PATH Env:NINJA_STATUS -Value "%e [%f/%t] "
Set-Item -Path Env:DOCKER_BUILDKIT -Value 1
Set-Item -Path Env:DOTNET_NOLOGO -Value "true"
Set-Item -Path Env:FZF_DEFAULT_COMMAND -Value "fd --type f"
Set-Item -Path Env:LESSCHARSET -Value "utf-8"

<# Terminal Settings #>
Set-PSReadlineOption @ReadlineConfig

Set-PSReadlineKeyHandler -Chord Shift+Ctrl+a -Function SelectAll
Set-PSReadlineKeyHandler -Chord Ctrl+d -Function DeleteCharOrExit
Set-PSReadlineKeyHandler -Chord Ctrl+a -Function BeginningOfLine
Set-PSReadlineKeyHandler -Chord Ctrl+e -Function EndOfLine


if ((Test-Executable oh-my-posh) -and (Test-Path -LiteralPath "${script:OhMyPoshConfig}")) {
  oh-my-posh init pwsh --config "${script:OhMyPoshConfig}" | Invoke-Expression
}

if (-not (Get-Command -Module ProfileAsync -Name Import-ProfileAsync)) {
  Write-Warning "Import-ProfileAsync command is unavailable."
  return
}

Import-ProfileAsync {
  <# Platform Specific Settings #>
  if ($IsWindows) {
    Start-Service ssh-agent
  }

  if (Test-Executable gh) { gh completion --shell powershell | Out-String | Invoke-Expression }

  if (Test-Executable rustup) { rustup completions powershell | Out-String | Invoke-Expression }
  if (Test-Executable rclone) { rclone completion powershell | Out-String | Invoke-Expression }
  if (Test-Executable task) { task --completion powershell | Out-String | Invoke-Expression }
  if (Test-Executable hugo) { hugo completion powershell | Out-String | Invoke-Expression }
  if (Test-Executable op) { op completion powershell | Out-String | Invoke-Expression }

  # pack does it very differently
  if (Test-Executable pack) { . $(pack completion --shell powershell) }
}
