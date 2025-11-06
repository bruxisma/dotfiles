function Install-SerumPack {
  [CmdletBinding(SupportsShouldProcess)]
  param(
    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    [string]$Path,
    [String]$Name,
    [bool]$StripRedundant = $true,
    [bool]$Symlink = $true
  )

  begin {
    $XferRecords = $IsWindows `
      ? (Join-Path ([Environment]::GetFolderPath("MyDocuments")) "Xfer") `
      : "/Library/Audio/Presets/Xfer Records"
    $Presets = Join-Path $XferRecords "Serum Presets" "Presets"
    $Tables = Join-Path $XferRecords "Serum Presets" "Tables"
    $Noises = Join-Path $XferRecords "Serum Presets" "Noises"
  }

  process {
    if (!(Split-Path -Path $Path -IsAbsolute)) {
      $Path = Join-Path ${PWD} $Path
    }
    if (!(Test-Path -LiteralPath $Path -PathType Container)) {
      Write-Error -Message "'${Path}' is not a directory or does not exist" -Category InvalidArgument
      return
    }

    if (!($PSBoundParameters.ContainsKey("Name"))) {
      $Name = (Get-Item $Path).BaseName
    }

    if ($StripRedundant) {
      $Name = $Name -replace "(?:Serum|Presets?)",""
    }

    $Destination = Join-Path $Presets $Name

    if ($PSCmdlet.ShouldProcess($Path, "Link ${Name} to ${Path}")) {
      New-Item -Path $Destination -Value $Path -Type SymbolicLink
    }
  }
}
