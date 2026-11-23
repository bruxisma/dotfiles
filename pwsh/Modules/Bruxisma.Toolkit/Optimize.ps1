function Optimize-PNG {
  [CmdletBinding(SupportsShouldProcess)]
  param(
    [Parameter(Position=0, Mandatory)]
    [ValidateNotNullOrEmpty()]
    [string]$LiteralPath,
    [ValidateNotNull()]
    [string]$Destination = ""
  )

  $File = Get-ChildItem -LiteralPath "$LiteralPath" -File
  # TODO: Support directories
  if ($Destination -eq [String]::Empty) {
    $Destination = Join-Path $File.Directory "optimized-$($File.Name)"
  }
  if (Test-Path -Container $Destination) {
    $Destination = Join-Path $Destination $File.Name
  }

  if ($PSCmdlet.ShouldProcess($Path, "Optimizing $File to $Destination")) {
    oxipng "${File}" --opt max --alpha --strip safe --preserve --zopfli --out "${Destination}"
    Get-ChildItem -File -LiteralPath "${Destination}"
  }
}
