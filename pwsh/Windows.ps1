Set-EnvironmentVariable EDITOR (Get-ItemProperty HKLM:\Software\Vim\Gvim).Path
Set-EnvironmentVariable GOPATH (Join-Path $env:LOCALAPPDATA Go)

Set-EnvironmentVariable GNUPGHOME (Join-Path $env:LOCALAPPDATA gnupg)

Set-Alias touch Touch-Item -Scope Global
Set-Alias open Start-Process -Scope Global

Update-Path 'C:\MinGW\bin'

Update-Path "${env:ProgramFiles(x86)}\GitHub CLI"
Update-Path "${env:ProgramFiles(x86)}\GnuPG\bin"
Update-Path "${env:ProgramFiles}\Yubico\YubiKey Manager"
Update-Path ${env:GOPATH}\bin
Update-Path ${env:EDITOR}

Add-WindowsPSModulePath

Start-Service ssh-agent
