Set-EnvironmentVariable EDITOR (Get-ItemProperty HKLM:\Software\Vim\Gvim).Path
Set-EnvironmentVariable GOPATH (Join-Path $env:LOCALAPPDATA Go)

Set-EnvironmentVariable GNUPGHOME (Join-Path $env:LOCALAPPDATA gnupg)

Set-Alias touch Touch-Item -Scope Global
Set-Alias open Start-Process -Scope Global

Update-SystemPath 'C:\MinGW\bin'

Update-SystemPath "${env:ProgramFiles(x86)}\GitHub CLI"
Update-SystemPath "${env:ProgramFiles(x86)}\GnuPG\bin"
Update-SystemPath "${env:ProgramFiles}\Yubico\YubiKey Manager"
Update-SystemPath ${env:GOPATH}\bin
Update-SystemPath $(Split-Path -Parent ${env:EDITOR})
Update-SystemPath ${HOME}\.cargo\bin

Add-WindowsPSModulePath

Start-Service ssh-agent
