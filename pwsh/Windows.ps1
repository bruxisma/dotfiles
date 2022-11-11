function global:Activate-Venv {
  if (Test-Path .venv) {
    Import-Module .venv/Scripts/Activate.ps1
  }
}

function global:Touch-Item {
  param(
    [Parameter(Mandatory=$true)]
    [string[]]$Paths
  )
  $Paths | ForEach-Object {
    if (Test-Path -LiteralPath $_) {
      (Get-Item -Path $_).LastWriteTime = Get-Date
    } else {
      New-Item -Type File -Path $_
    }
  }
}

function global:Invoke-Exa { & bash.exe -c "`$HOME/.cargo/bin/exa $args" }

$env:EDITOR = (Get-ItemProperty HKLM:\SOFTWARE\Vim\Gvim\).Path
$env:GOPATH = "$env:LOCALAPPDATA\Go"

Set-Alias clear Clear-Terminal -Scope Global
Set-alias touch Touch-Item -Scope Global

Set-Alias open Start-Process -Scope Global
Set-Alias exa Invoke-Exa -Scope Global

Append-Path 'C:\MinGW\bin'
Append-Path $env:EDITOR

Add-WindowsPSModulePath

Start-Service ssh-agent
