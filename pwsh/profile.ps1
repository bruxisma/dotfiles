using namespace System.Collections.Generic
using namespace System.Text
using namespace System.IO

<# Bootstrap #>
[Console]::OutputEncoding = [Encoding]::UTF8

function script:Import-Completions {
  [CmdletBinding()]
  param(
    [Parameter(Position=0, Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [String]$Command,
    [Parameter(Position=1, ValueFromRemainingArguments)]
    [String[]]$Arguments)

  if (-not (Get-Command ${Command} -ErrorAction SilentlyContinue)) { return }
  if (Test-Path -LiteralPath $(Get-Command ${Command}).Source) {
    & ${Command} ${Arguments} | Out-String | Invoke-Expression
  }
}

function script:Import-Source {
  [CmdletBinding(SupportsShouldProcess)]
  param(
    [Parameter(Position=0, Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [String]$Path)
  if ($PSCmdlet.ShouldProcess(${Path})) {
    . ${Path}
  }
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

Import-Completions gh completion --shell powershell
Import-Completions just --completions powershell

Import-Completions rustup completions powershell
Import-Completions hugo completion powershell
Import-Completions op completion powershell

if (${pack} = Get-Command -Name "pack" -CommandType Application -ErrorAction SilentlyContinue) {
  Import-Source $(& ${pack} completion --shell powershell)
}

# TODO: Move to eza: https://github.com/eza-community/eza
<# Aliases #>
if (!$IsWIndows -and (Get-Command -Name "lsd" -CommandType Application -ErrorAction SilentlyContinue)) {
  Set-Alias ls lsd
}

if ($IsWindows) {
  Set-Alias touch Update-File
  Set-Alias open Start-Process
}

Set-Alias reload Update-Profile
Set-Alias which Get-Command
Set-Alias edit Edit-File
Set-Alias info Get-Help

<# Environment Variables #>
if (${nvim} = Get-Command -Name "nvim" -CommandType Application -ErrorAction SilentlyContinue -TotalCount 1) {
  Set-Item -Path Env:EDITOR -Value ${nvim}.Source
}

${private:Paths} += @(
  Join-Path ${HOME} .local bin
  Join-Path ${HOME} .cargo bin
)

if ($IsWindows) {
  ${private:Paths} += @(
    Join-Path C: MinGW bin
    Join-Path ${env:LOCALAPPDATA} Microsoft WindowsApps
    Join-Path ${env:ProgramFiles(x86)} "GitHub CLI"
    Join-Path ${env:ProgramFiles} Yubico "Yubikey Manager"
    Split-Path -Parent ${env:EDITOR}
  )
}

if ($IsMacOS) {
  ${private:Paths} += @("/usr/local/share/dotnet")
}

Set-Item -Path Env:PATH -Value $(${private:Paths} -join ${private:Separator})

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

Set-Item -Path Env:AWS_SHARED_CREDENTIALS -Value $(Join-Path "${env:XDG_CONFIG_HOME}" aws credentials)
Set-Item -Path Env:AWS_CONFIG_FILE -Value $(Join-Path "${env:XDG_CONFIG_HOME}" aws config)

Set-Item -Path Env:NUGET_PLUGINS_CACHE_PATH -Value $(Join-Path ${env:XDG_CACHE_HOME} nuget plugins-cache)
Set-Item -Path Env:NUGET_HTTP_CACHE_PATH -Value $(Join-Path ${env:XDG_CACHE_HOME} nuget v3-cache)
Set-Item -Path Env:NUGET_PACKAGES -Value $(Join-Path ${env:XDG_DATA_HOME} nuget packages)

Set-Item -Path Env:GOAMD64 -Value "v3"
Set-Item -Path Env:GOPATH -Value $(Join-Path ${HOME} .local share go)
Set-Item -Path Env:GOBIN -Value $(Join-Path ${HOME} .local bin)

Set-Item -Path Env:NPM_CONFIG_USERCONFIG -Value $(Join-Path ${env:XDG_CONFIG_HOME} npm config)
Set-Item -Path Env:DOCKER_CONFIG -Value $(Join-Path ${env:XDG_CONFIG_HOME} docker)

Set-Item -Path Env:PULUMI_HOME -Value $(Join-Path ${env:XDG_DATA_HOME} pulumi)
Set-Item -Path Env:PACK_HOME -Value $(Join-Path ${env:XDG_CONFIG_HOME} pack)
Set-Item -Path Env:GNUPGHOME -Value $(Join-Path ${env:XDG_DATA_HOME} gnupg)

<# General Values #>
Set-Item -Path Env:CMAKE_GENERATOR -Value "Ninja Multi-Config"
Set-Item -PATH Env:NINJA_STATUS -Value "%e [%f/%t] "
Set-Item -Path Env:DOCKER_BUILDKIT -Value 1
Set-Item -Path Env:DOTNET_NOLOGO -Value "true"
Set-Item -Path Env:FZF_DEFAULT_COMMAND -Value "fd --type f"
Set-Item -Path Env:LESSCHARSET -Value "utf-8"
Set-Item -Path Env:CARGO_REGISTRIES_CRATES_IO_PROTOCOL -Value "sparse"

<# Platform Specific Settings #>
if ($IsWindows) {
  Start-Service ssh-agent
}

Import-Source $(Join-Path $PSScriptRoot cmake.ps1)
Import-Source $(Join-Path $PSScriptRoot task.ps1)
Import-Source $(Join-Path $PSScriptRoot ssh.ps1)

<# Terminal Settings #>
Set-PSReadlineOption @private:ReadlineConfig

Set-PSReadlineKeyHandler -Chord Ctrl+d -Function DeleteCharOrExit
Set-PSReadlineKeyHandler -Chord Ctrl+a -Function BeginningOfLine
Set-PSReadlineKeyHandler -Chord Ctrl+e -Function EndOfLine

if ((Get-Command oh-my-posh) -and (Test-Path -LiteralPath "${script:OhMyPoshConfig}")) {
  oh-my-posh init pwsh --config "${script:OhMyPoshConfig}" | Invoke-Expression
} else {
  function Prompt {
    $machine = [Environment]::MachineName.ToLower()
    $user = [Environment]::UserName.ToLower()
    $GREEN = "`e[1;32m"
    $CYAN = "`e[1;36m"
    $RESET = "`e[0m"
    "${GREEN}[${user}@${machine}]${RESET}:${CYAN}$(Get-Location | Convert-Path)${RESET}$ "
  }
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

function Edit-File {
  [CmdletBinding()]
  param(
    [Parameter(Position=0, Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [String]$Path,
    [Parameter(Position=1, ValueFromRemainingArguments)]
    [String[]]$Arguments
  )
  if (-not (Test-Path Env:EDITOR)) {
    Write-Error "EDITOR environment variable is not set"
    return
  }
  & ${env:EDITOR} ${Path} ${Arguments}
}

function Update-File {
  [CmdletBinding()]
  param(
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [String[]]$Paths
  )
  $Paths | ForEach-Object {
    if (Test-Path -LiteralPath $_) {
      (Get-Item -Path $_).LastWriteTime = Get-Date
    } else {
      New-Item -ItemType File -Path $_
    }
  }

}

function Edit-LocalProfile {
  Edit-File $(Join-Path $PSScriptRoot machine.ps1)
}

function Edit-Profile {
  Edit-File $PROFILE.CurrentUserAllHosts
}

function Update-LocalProfile {
  [CmdletBinding(SupportsShouldProcess)]
  param()
  if ($PSCmdlet.ShouldProcess("${PSScriptRoot}/machine.ps1")) {
    . $PSScriptRoot/machine.ps1
  }
}

function Update-Profile {
  [CmdletBinding(SupportsShouldProcess)]
  param()
  if ($PSCmdlet.ShouldProcess($PROFILE.CurrentUserAllHosts)) {
    . $PROFILE.CurrentUserAllHosts
  }
}

