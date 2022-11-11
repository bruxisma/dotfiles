# https://launchd.info
# TODO: This set of commands are not complete
function Suspend-Service { }
function Resume-Service { }

function global:Restart-Service {
  param(
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [String]
    $Service
  )
  Start-Service $Service
  Stop-Service $Service
}

function global:Start-Service {
  param(
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [String]
    $Service
  )
  launchctl start $Service
}

function global:Stop-Service {

  param(
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [String]
    $Service
  )
  launchctl stop $Service
}

function global:Get-Service ([String]$Service) { launchctl list $Service }
function Set-Service { }

function Remove-Service { launchctl unload }
function New-Service { launchctl load }

Set-Alias ls exa -Scope Global

Prepend-Path /usr/local/bin
Append-Path /Library/Frameworks/Python.framework/Versions/3.7/bin
Append-Path /Applications/MacVim.app/Contents/bin
Append-Path /Applications/CMake.app/Contents/bin
Append-Path /usr/local/share/dotnet
