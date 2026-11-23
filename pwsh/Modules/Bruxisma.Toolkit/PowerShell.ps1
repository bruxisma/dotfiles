using namespace System.Management.Automation;
function Update-PowerShell {
  [CmdletBinding()]
  param(
    [Switch]$DownloadOnly,
    [Switch]$KeepDownload
  )
  if ($IsWindows) { return }
  if ($IsLinux) { return }
  $Release = gh release list --repo PowerShell/PowerShell `
    --jq 'map(select(.isLatest == true))[0]' `
    --json isLatest,tagName,name `
    --exclude-drafts `
    --exclude-pre-releases `
    | ConvertFrom-Json
  $VersionMatch = Select-String -Pattern 'v(.+)' -InputObject $Release.tagName
  $Version = [SemanticVersion]::new($VersionMatch.Matches.Groups[1].Value)
  if ($Version -eq $PSVersionTable.PSVersion) {
    Write-Host "PowerShell is already at the latest release $($Release.tagName)"
    return
  }
  $Output = "powershell-$($Version)-osx-arm64.pkg"
  $Destination = Join-Path $HOME "Downloads" $Output
  gh release download --repo "PowerShell/PowerShell" $Release.tagName `
    --pattern $Output `
    --dir (Join-Path $HOME Downloads)
  if ($DownloadOnly) { return }
  sudo installer -pkg $Destination -target /
  if ($KeepDownload) { return }
  Remove-Item $Destination
}
