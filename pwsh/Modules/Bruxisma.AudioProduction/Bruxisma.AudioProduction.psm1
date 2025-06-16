# TODO: Support files
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

#function Compress-DSLibrary {
#  [CmdletBinding(SupportsShouldProcess, DefaultParameterSetName="Default")]
#  param(
#    [Parameter(Mandatory)]
#    [ValidateNotNullOrEmpty()]
#    [string]$Name,
#    [ValidateNotNullOrEmpty()]
#    [string]$Workspace = "Workspace",
#    [ValidateNotNull()]
#    [string[]]$Include = @(),
#    [ValidateNotNull()]
#    [string[]]$Exclude = @(),
#    [switch]$Update,
#    [switch]$Force
#  )
#
#  begin {
#    ${Samples} = Get-ChildItem -Recurse *.wav
#    | ForEach-Object { Join-Path (Resolve-Path -Relative (Split-Path $_ -Parent)) $_.BaseName }
#
#    ${Directories} = ${Samples}
#    | ForEach-Object { Split-Path $_ -Parent }
#    | Sort-Object -Unique
#
#    ${Presets} = Get-ChildItem *.dspreset
#
#    ${Compress} = @{
#      Path = "${Workspace}/*"
#      CompressionLevel = "Optimal"
#      DestinationPath = "${Name}.dslibrary"
#    }
#
#    if (${Update}) { ${Compress}["Update"] = $true }
#    elseif (${Force}) { ${Compress}["Force"] = $true }
#
#    [xml]$Document = New-Object System.Xml.XmlDocument
#    ${Declaration} = ${Document}.CreateXmlDeclaration("1.0", "UTF-8", $null)
#    ${Info} = ${Document}.CreateElement("DecentSamplerLibraryInfo")
#    ${Info}.SetAttribute("name", ${Name})
#    $null = ${Document}.AppendChild(${Declaration})
#    $null = ${Document}.AppendChild(${Info})
#  }
#
#  ${Directories}
#  | ForEach-Object { New-Item -ItemType Directory -Path ${Workspace} -Name $_ -ErrorAction SilentlyContinue }
#
#  ${Files}
#  | Where-Object { -not (Test-Path -PathType Leaf -Path "${Workspace}/${_}.flac") }
#  | ForEach-Object { ffmpeg -hide_banner -log_level error -n -i "${_}.wav" -acodec flac "${Workspace}/${_}.flac" }
#
#  ${Preset}
#  | ForEach-Object { Copy-Item -Path $_ -Destination ${Workspace} }
#
#  ${Include}
#  | ForEach-Object { Copy-Item -Path $_ -Destination ${Workspace} -Recurse -Container -Force }
#
#  process {
#    ${Document}.Save("${PWD}/${Workspace}/DSLibraryInfo.xml")
#    Compress-Archive @Compress
#  }
#}
