filter script:root { $_.Replace((Resolve-Path $_).Drive.Root, '/') }
filter script:home { $_.Replace($HOME, '~') }
filter script:sep { $_.Replace('\', '/') }

function Import-Completions {
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

function Get-PromptPath {
  Get-Location | Convert-Path | script:home | script:root | script:sep
}

function Get-HostName { [Environment]::UserDomainName.ToLower() }
function Get-UserName { [Environment]::UserName.ToLower() }

function Update-Profile { . $PROFILE.CurrentUserAllHosts }
function Edit-Profile { Edit-File $PROFILE.CurrentUserAllHosts }

function Update-LocalProfile { . $PSScriptRoot/Machine.ps1 }
function Edit-LocalProfile { Edit-File $PSScriptRoot/Machine.ps1 }

function Edit-File([String]$Path) { & $env:EDITOR $Path }

function Touch-Item {
  [CmdletBinding()]
  param(
    [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
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

<# Truly clears History from *everything* #>
function Clear-History {
  Remove-Item $(Get-PSReadlineOption).HistorySavePath
  [Microsoft.PowerShell.PSConsoleReadLine]::ClearHistory()
  Clear-Host
}

<# Updates all installed cargo tools *if* cargo is installed #>
function Update-CargoTools {
  if (-not (Get-Command "cargo" -ErrorAction SilentlyContinue)) { return }
  cargo install --list `
  | Where-Object { $_ -match '^\S' } `
  | Foreach-Object { cargo install "$($_ -replace '^(\S+).*$', '$1')" }
}
