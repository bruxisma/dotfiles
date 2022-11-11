function global:Activate-Venv {
  if (Test-Path .venv) {
    Import-Module .venv/Scripts/Activate.ps1
  }
}

function global:Invoke-Exa { & bash.exe -c "`$HOME/.cargo/bin/exa $args" }

$env:EDITOR = (Get-ItemProperty HKLM:\SOFTWARE\Vim\Gvim\).Path

Set-Alias clear Clear-Terminal -Scope Global
Set-Alias open Start-Process -Scope Global
Set-Alias exa Invoke-Exa -Scope Global

Append-Path 'C:\MinGW\bin'
Append-Path $env:EDITOR

Add-WindowsPSModulePath
