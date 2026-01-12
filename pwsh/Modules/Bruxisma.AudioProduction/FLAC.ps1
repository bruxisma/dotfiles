function ConvertTo-FLAC {
  [CmdletBinding()]
  param(
    [Parameter(Mandatory, Position = 0)]
    [ValidateNotNullOrEmpty()]
    [String]$LiteralPath = $PWD,

    [String]$Destination,

    [Parameter(Position = 1)]
    [String]$Filter,
    [String[]]$Include,
    [String[]]$Exclude,
    [Switch]$Recurse,
    [Switch]$Force,
    [Switch]$AutoRemove
  )

  begin {
    $GCI = @{
      LiteralPath = $LiteralPath
      Include = $Include
      Exclude = $Exclude
      Filter = $Filter
      Recurse = $Recurse
    }
    $Files = Get-ChildItem @GCI -File
    $Idx = 0
    $ArgumentList = @(
      "--keep-foreign-metadata-if-present"
      "--exhaustive-model-search"
      "--preserve-modtime"
      "--threads=4"
      "--verify"
      "--silent"
      "--best"
    )

    if ($AutoRemove) { $ArgumentList += "--delete-input-file" }
    if ($Force) { $ArgumentList += "--force" }

    if ([String]::IsNullOrEmpty($Destination)) { $Destination = $PWD }
  }

  process {
    foreach ($File in $Files) {
      $Target = $File
      if (Test-Path -LiteralPath $Destination -PathType Container) {
        $Target = Join-Path $Destination $Target.Name
      }
      $Target = [IO.Path]::ChangeExtension($Target, ".flac")
      Write-Progress -Activity "Compressing" -Status $File.Name -PercentComplete ($Idx++ / $Files.Length * 100)
      flac @ArgumentList "$File" "--output-name=$Target"
    }
  }

  end { Write-Progress -Activity "Compressing" -Completed }
}
