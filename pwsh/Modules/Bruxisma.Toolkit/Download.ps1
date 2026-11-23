<#
.SYNOPSIS
Attempt to get a favicon for a website via icon.horse. *Usually* works without
issue.
#>
function Get-Favicon {
  [CmdletBinding(SupportsShouldProcess)]
  param(
    [Parameter(Position=0, Mandatory)]
    [ValidateNotNull()]
    [uri]$Website,
    [Parameter(Position=1)]
    [ValidateNotNull()]
    [string]$Destination = ""
  )
  $Domain = $Website.Host
  if ($Destination -eq [String]::Empty) {
    $Directory = if ($IsWindows) {
      (New-Object -ComObject Shell.Application).NameSpace('shell:Downloads').Self.Path
    } else { Join-Path -Path $HOME -ChildPath "Downloads" }
    $Destination = Join-Path $Directory "$Domain.png"
  }
  if (Test-Path -PathType Container -LiteralPath $Destination) {
    $Destination = Join-Path $Destination "$Domain.png"
  }
  if ($PSCmdlet.ShouldProcess($Website, "Downloading favicon from $Website to $Destination")) {
    curl --silent --show-error --fail --location "https://icon.horse/icon/$Domain"--output $Destination --create-dirs
  }
}


