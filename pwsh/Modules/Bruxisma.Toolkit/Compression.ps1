function Compress-Item {
  [CmdletBinding(SupportsShouldProcess)]
  param(
    [Parameter(Position=0, Mandatory)]
    [ValidateNotNullOrEmpty()]
    [string]$Path,
    [ValidateNotNull()]
    [string]$Destination = ""
  )

  if ($Destination -eq [String]::Empty) { $Destination = "${Path}.zst" }
  if ($PSCmdlet.ShouldProcess($Path, "Compressing $Path to $Destination")) {
    zstd -22 --ultra -T0 --long=31 "${Path}" -o "${Destination}"
    Get-Item -LiteralPath "${Destination}"
  }
}

function Expand-Item {
  [CmdletBinding(SupportsShouldProcess)]
  param(
    [Parameter(Position=0, Mandatory)]
    [ValidateNotNullOrEmpty()]
    [string]$Path,
    [ValidateNotNull()]
    [string]$Destination = "",
    [Int]$Memory
  )
  $ArgumentList = @()
  if ($Memory) {
    $ArgumentList += @("--memory=$($Memory/1MB)MB")
  }
  $Path = Get-ChildItem -LiteralPath $Path

  if ($Destination -eq [String]::Empty) {
    $Destination = Join-Path (Split-Path $Path -Parent) (Split-Path $Path -LeafBase)
  }
  if ($PSCmdlet.ShouldProcess($Path, "Expanding $Path to $Destination")) {
    zstd --decompress "${Path}" -o "${Destination}" $ArgumentList
  }
}


