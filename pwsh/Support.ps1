filter script:root { $_.Replace((Resolve-Path $_).Drive.Root, '/') }
filter script:home { $_.Replace($HOME, '~') }
filter script:sep { $_.Replace('\', '/') }

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
      New-Item -Type File -Path $_
    }
  }
}


