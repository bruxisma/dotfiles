function ConvertTo-SamplePack {
  [CmdletBinding()]
  param(
    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    [String]$LiteralPath,
    [String]$Destination,
    [Switch]$Strip
  )

  begin {
    $Archive = Get-Item -LiteralPath $LiteralPath
    $Workspace = [IO.Directory]::CreateTempSubdirectory("convert-samplepack-")
    $Destination = [String]::IsNullOrEmpty($Destination) `
      ? ([IO.Path]::ChangeExtension($Archive.FullName, ".samplepack")) `
      : $Destination
  }

  process {
    tar --extract `
      --directory $Workspace `
      --file $Archive `
      --exclude .DS_Store$ `
      --exclude Icon$ `
      --exclude __MACOSX* `
      --strip-components=$([int]([bool]($Strip)))
    ConvertTo-WavPack -LiteralPath $Workspace -Recurse -Force -AutoRemove -Include *.wav,*.aif,*.caf
    [IO.Compression.ZipFile]::CreateFromDirectory($Workspace, $Destination, "Optimal", $false)
    (Get-Item $Destination).LastWriteTime = $Archive.LastWriteTime
  }

  clean {
    Remove-Item -Recurse -Force $Workspace
  }
}


