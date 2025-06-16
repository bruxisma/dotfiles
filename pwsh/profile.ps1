using namespace System.Collections.Generic
using namespace System.Text
using namespace System.IO

<# Bootstrap #>
[Console]::OutputEncoding = [Encoding]::UTF8

function script:Test-Executable {
  [CmdletBinding()]
  param(
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [String]$Command
  )

  $Application = Get-Command -Name ${Command} -Type Application -ErrorAction SilentlyContinue -TotalCount 1
  if (-not ${Application}) { return $false }
  Test-Path -LiteralPath ${Application}.Source -PathType Leaf
}

# Explicitly set XDG fallback values
${env:XDG_CONFIG_HOME} ??= $(Join-Path ${HOME} ".config")
${env:XDG_CACHE_HOME} ??= $(Join-Path ${HOME} ".cache")
${env:XDG_STATE_HOME} ??= $(Join-Path ${HOME} ".local" "share" "state")
${env:XDG_DATA_HOME} ??= $(Join-Path ${HOME} ".local" "share")

# Import local profile *first*
Import-Module $(Join-Path $PSScriptRoot machine.ps1) -Force -Global

<# Script Local Variables #>
Set-Variable -Scope Script -Name OhMyPoshConfig -Value (Join-Path ${env:XDG_CONFIG_HOME} oh-my-posh config.yml)
Set-Variable -Scope Private -Name ReadlineConfig -Value (Import-PowerShellDataFile "${PSScriptRoot}/readline.psd1")
Set-Variable -Scope Private -Name Separator -Value ([Path]::PathSeparator)
Set-Variable -Scope Private -Name Paths -Value ([List[String]]::new((${env:PATH} -split ${private:Separator})))

# Custom Completions
Import-Module $(Join-Path $PSScriptRoot completion.ps1) -Force -Global

<# Aliases #>
if (!$IsWIndows && Get-Command -Name "eza" -CommandType Application -ErrorAction SilentlyContinue -TotalCount 1) {
  Set-Alias ls eza
}

if ($IsWindows) {
  Set-Alias touch Update-File
  Set-Alias open Start-Process
}

Set-Alias which Get-Command
Set-Alias edit Edit-File

<# Environment Variables #>
${private:Paths} += @(
  Join-Path ${HOME} .local bin
  Join-Path ${HOME} .cargo bin
)

if ($IsWindows) {
  ${private:Paths} += @(
    Join-Path C: MinGW bin
    Join-Path ${env:LOCALAPPDATA} Microsoft WindowsApps
  )
}

if ($IsMacOS) {
  ${private:Paths} += @("/usr/local/share/dotnet")
}

Set-Item -Path Env:PATH -Value $(${private:Paths} -join ${private:Separator})

if (${nvim} = Get-Command -Name "nvim" -CommandType Application -ErrorAction SilentlyContinue -TotalCount 1) {
  Set-Item -Path Env:EDITOR -Value ${nvim}.Source
}

<# XDG Tooling Fixes #>
# Run once to set env var for user on Windows. Sets it globally, so we don't
# have to worry about jack shit.
# Set-ItemProperty -Path HKCU:Environment -Name <name> -Value <value>
#
# Set permanent env:PATH on macOS with
# Out-File -FilePath /etc/paths.d/<name> <value>
#
# Set permanent env:PATH on Linux with
# Out-File -FilePath /etc/environment -Append "${name}=${value}"

Set-Item -Path Env:NUGET_PLUGINS_CACHE_PATH -Value $(Join-Path ${env:XDG_CACHE_HOME} nuget plugins-cache)
Set-Item -Path Env:NUGET_HTTP_CACHE_PATH -Value $(Join-Path ${env:XDG_CACHE_HOME} nuget v3-cache)
Set-Item -Path Env:NUGET_PACKAGES -Value $(Join-Path ${env:XDG_DATA_HOME} nuget packages)

Set-Item -Path Env:GOAMD64 -Value "v3"
Set-Item -Path Env:GOPATH -Value $(Join-Path ${HOME} .local share go)
Set-Item -Path Env:GOBIN -Value $(Join-Path ${HOME} .local bin)

Set-Item -Path Env:NPM_CONFIG_USERCONFIG -Value $(Join-Path ${env:XDG_CONFIG_HOME} npm config)
Set-Item -Path Env:DOCKER_CONFIG -Value $(Join-Path ${env:XDG_CONFIG_HOME} docker)

Set-Item -Path Env:PACK_HOME -Value $(Join-Path ${env:XDG_CONFIG_HOME} pack)

Set-Item -Path Env:CCACHE_DIR -Value $(Join-Path ${env:XDG_CACHE_HOME} "ccache")

<# General Values #>
Set-Item -Path Env:CMAKE_GENERATOR -Value "Ninja Multi-Config"
Set-Item -PATH Env:NINJA_STATUS -Value "%e [%f/%t] "
Set-Item -Path Env:DOCKER_BUILDKIT -Value 1
Set-Item -Path Env:DOTNET_NOLOGO -Value "true"
Set-Item -Path Env:FZF_DEFAULT_COMMAND -Value "fd --type f"
Set-Item -Path Env:LESSCHARSET -Value "utf-8"

<# Terminal Settings #>
Set-PSReadlineOption @private:ReadlineConfig

Set-PSReadlineKeyHandler -Chord Ctrl+d -Function DeleteCharOrExit
Set-PSReadlineKeyHandler -Chord Ctrl+a -Function BeginningOfLine
Set-PSReadlineKeyHandler -Chord Ctrl+e -Function EndOfLine

if ((Get-Command oh-my-posh) -and (Test-Path -LiteralPath "${script:OhMyPoshConfig}")) {
  oh-my-posh init pwsh --config "${script:OhMyPoshConfig}" | Invoke-Expression
}

<# Truly clears History from *everything* #>
function Clear-History {
  [CmdletBinding(SupportsShouldProcess)]
  param()
  $history = $(Get-PSReadlineOption).HistorySavePath

  if ($PSCmdlet.ShouldProcess("${history}", "Remove-Item")) {
    Remove-Item -Path "${history}"
  }
  if ($PSCmdlet.ShouldProcess("PSReadline::ClearHistory", "Clear-History")) {
    [Microsoft.PowerShell.PSReadline]::ClearHistory()
  }
  Clear-Host
}

Import-ProfileAsync {
  <# Platform Specific Settings #>
  if ($IsWindows) {
    Start-Service ssh-agent
  }

  if (Test-Executable gh) { gh completion --shell powershell | Out-String | Invoke-Expression }
  if (Test-Executable just) { just --completions powershell | Out-String | Invoke-Expression }

  if (Test-Executable rustup) { rustup completions powershell | Out-String | Invoke-Expression }
  if (Test-Executable rclone) { rclone completion powershell | Out-String | Invoke-Expression }
  if (Test-Executable task) { task --completion powershell | Out-String | Invoke-Expression }
  if (Test-Executable hugo) { hugo completion powershell | Out-String | Invoke-Expression }
  if (Test-Executable op) { op completion powershell | Out-String | Invoke-Expression }

  # pack does it very differently
  if (Test-Executable pack) { . $(pack completion --shell powershell) }
}
