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

  if ($PSCmdlet.ShouldProcess("${scriptRoot}/machine.ps1")) {
    Import-Module ${PROFILE} -Force -Global
  }
}

function Update-Profile {
  [CmdletBinding(SupportsShouldProcess)]
  param()
  if (${PSCmdlet}.ShouldProcess(${PROFILE}.CurrentUserAllHosts)) {
    Import-Module ${PROFILE}.CurrentUserAllHosts -Force -Global
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
  Edit-File ${PROFILE}.CurrentUserCurrentHost
}

function Edit-Profile {
  Edit-File $PROFILE.CurrentUserAllHosts
}

function Test-Executable {
  [CmdletBinding()]
  param(
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [String]$Command
  )

  $Application = Get-Command -Name ${Command} -Type Application -ErrorAction SilentlyContinue -TotalCount 1
  if (-not ${Application}) { return $null }
  if (-not (Test-Path -LiteralPath ${Application}.Source -PathType Leaf)) { return $null }
  return ${Application}
}

function Clear-History {
  [CmdletBinding(SupportsShouldProcess)]
  param()
  $history = $(Get-PSReadlineOption).HistorySavePath

  if ($PSCmdlet.ShouldProcess("${history}", "Remove-Item")) {
    Remove-Item -Path "${history}"
  }
  if ($PSCmdlet.ShouldProcess("PSReadline::ClearHistory", "Clear-History")) {
    [Microsoft.PowerShell.PSReadline]::ClearHistory()
  }
  Clear-Host
}
