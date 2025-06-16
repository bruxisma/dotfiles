function Update-File {
  [CmdletBinding()]
  param(
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [String[]]$Paths
  )
  $Paths | ForEach-Object {
    if (Test-Path -LiteralPath $_) {
      (Get-Item -Path $_).LastWriteTime = Get-Date
    } else {
      New-Item -ItemType File -Path $_
    }
  }

}

function Update-LocalProfile {
  [CmdletBinding(SupportsShouldProcess)]
  param()

  $scriptRoot = Split-Path $PROFILE.CurrentUserAllHosts -Parent

  if ($PSCmdlet.ShouldProcess("${scriptRoot}/machine.ps1")) {
    Import-Module $(Join-Path ${scriptRoot} machine.ps1) -Force -Global
  }
}

function Update-Profile {
  [CmdletBinding(SupportsShouldProcess)]
  param()
  if ($PSCmdlet.ShouldProcess($PROFILE.CurrentUserAllHosts)) {
    Import-Module $PROFILE.CurrentUserAllHosts -Force -Global
  }
}

function Edit-File {
  [CmdletBinding()]
  param(
    [Parameter(Position=0, Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [String]$Path,
    [Parameter(Position=1, ValueFromRemainingArguments)]
    [String[]]$Arguments
  )
  if (-not (Test-Path Env:EDITOR)) {
    Write-Error "EDITOR environment variable is not set"
    return
  }
  & ${env:EDITOR} ${Path} ${Arguments}
}

function Edit-LocalProfile {
  Edit-File $(Join-Path $(Split-Path $PROFILE.CurrentUserAllHosts -Parent) machine.ps1)
}

function Edit-Profile {
  Edit-File $PROFILE.CurrentUserAllHosts
}
