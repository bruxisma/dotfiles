Set-EnvironmentVariable EDITOR (Get-ItemProperty HKLM:\Software\Vim\Gvim).Path
Set-EnvironmentVariable GOPATH (Join-Path $env:LOCALAPPDATA Go)

Set-Alias touch Touch-Item -Scope Global
Set-Alias open Start-Process -Scope Global

Update-Path 'C:\MinGW\bin'
Update-Path $env:EDITOR
Update-Path 'C:\Program Files (x86)\GitHub CLI'

Add-WindowsPSModulePath

Start-Service ssh-agent
