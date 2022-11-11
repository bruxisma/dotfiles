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

Update-Path -Prepend /usr/local/bin
Update-Path /Library/Frameworks/Python.framework/Versions/3.7/bin
Update-Path /Applications/MacVim.app/Contents/bin
Update-Path /Applications/CMake.app/Contents/bin
Update-Path /usr/local/share/dotnet
