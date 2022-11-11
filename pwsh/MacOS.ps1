# https://launchd.info
# TODO: This set of commands are not complete
function Suspend-Service { }
function Resume-Service { }

function Restart-Service { }
function Start-Service { launchtl start }
function Stop-Service { launchtl stop }

function Get-Service { launchctl list }
function Set-Service { }

function Remove-Service { launchctl unload }
function New-Service { launchctl load }

Append-Path /usr/local/bin
Append-Path /Library/Frameworks/Python.framework/Version/3.7/bin
Append-Path /Applications/MacVim.app/Contents/bin
Append-Path /Applications/CMake.app/Contents/bin
Append-Path $HOME/.cargo/bin

$env:EDITOR = (which gvim)
