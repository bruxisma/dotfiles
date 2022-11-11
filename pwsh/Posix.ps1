function global:Import-ShellScript {
  [CmdletBinding()]
  param(
    [Parameter(Mandatory=$True)]
    [Alias("c")]
    [String]
    $Path,
    [String]
    $Shell = "bash"
  )
  if (-not (Test-File $Path)) {
    Write-Error "$($Path) does not exist"
    return
  }
  $environment = @{}
  & $Shell -c "source $($Path) && env" `
  | Where-Object { $_ -match "=" } `
  | Sort-Object -Unique `
  | ConvertFrom-StringData `
  | Foreach-Object { $environment += $_ }
  foreach ($entry in $environment.GetEnumerator()) {
    Set-Item -Force -Path Env:$($entry.Name) -Value $entry.Value
  }
}

$env:EDITOR = (which gvim)
$env:GOPATH = "$HOME/.cache/go"

Append-Path $HOME/.cargo/bin
Append-Path /usr/local/go/bin
