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

function Edit-File {
  [CmdletBinding()]
  param(
    [Parameter(Position=0, Mandatory)]
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
  Edit-File ${PROFILE}
}

function Edit-Profile {
  Edit-File $PROFILE.CurrentUserAllHosts
}

function Test-Executable {
  [CmdletBinding()]
  param(
    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    [String]$Command
  )

  $Arguments = {
    Name = ${Command}
    Type = "Application"
    ErrorAction = "SilentlyContinue"
    TotalCount = 1
  }

  $Application = Get-Command      `
    -ErrorAction SilentlyContinue `
    -Name ${Command}              `
    -Type Application             `
    -TotalCount 1

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

function Update-Timestamps {
  [CmdletBinding(SupportsShouldProcess)]
  param(
    [Parameter(Mandatory, Position=0)]
    [Alias("From")]
    [ValidateNotNullOrEmpty()]
    [String]$Path,
    [Parameter(Mandatory, Position=1)]
    [Alias("To")]
    [ValidateNotNullOrEmpty()]
    [String]$DestinationPath
  )
  $TargetPath = Get-Item -LiteralPath $DestinationPath -Force
  $SourcePath = Get-Item -LiteralPath $Path -Force
  Get-ChildItem -LiteralPath $Path -Recurse -Force
  | ForEach-Object {
    $Target = $PSItem.FullName.Replace($SourcePath.FullName, $TargetPath.FullName)
    if ((Test-Path $Target) -and $PSCmdlet.ShouldProcess($Target, "Update Timestamps")) {
      $Target = Get-Item -LiteralPath $Target -Force
      $Target.LastWriteTime = $PSItem.LastWriteTime
      $Target.CreationTime = $PSItem.CreationTime
    }
  }
  if ($PSCmdlet.ShouldProcess($TargetPath, "Update Timestamps")) {
    $TargetPath.LastWriteTime = $SourcePath.LastWriteTime
    $TargetPath.CreationTime = $SourcePath.CreationTime
  }
}
