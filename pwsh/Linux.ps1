# https://www.freedesktop.org/software/systemd/man/systemctl.html
# # TODO: This is not yet configured nor is it complete
function Suspend-Service { }
function Resume-Service { }

function Restart-Service { systemctl restart }
function Start-Service { systemctl start }
function Stop-Service { systemctl stop }

function Get-Service { systemctl status }
function Set-Service { systemctl set-property }

function Remove-Service { systemctl disable }
function New-Service { systemctl enable }

Set-Alias ls exa -Scope Global
