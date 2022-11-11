<#
.SYNOPSIS
  Returns $true or $false depending on whether or not a given registry key
  exists. (String passed in must be usable via get-itemproperty)
#>
function test-registry([string]$key) {
  try { get-itemproperty $key -erroraction stop }
  catch [Exception] { return $false }
  return $true
}

<#
.SYNOPSIS
  Adds the given registry key's value to $env:PATH. This allows for
  additional tools to be added to the path, without worrying about installers
  clearing out the environment variables (Looking at you, NSIS).
#>
function add-registrypath(
  [string]$name,
  [string]$key='(default)',
  [string]$append=''
) {
  if (!(test-registry $name)) { return } # TODO: Handle an error in this case
  $name = (get-itemproperty $name).$key
  if (!$name) { return } # TODO: See above
  $env:PATH += [String]::Format(";{0}", [IO.Path]::Combine($name, $append))
}

<#
.SYNOPSIS
  Adds the given path to $env:PATH. This allows for directories to be
  temporarily added just for powershell. Like vim. Or git. Or anything else,
  because why would you use cmd.exe?
#>
function add-path([string]$path) {
  $path = $path -replace '"', ""
  if (!(test-path $path)) { return }
  $is_file = test-path -pathtype leaf $path
  if ($is_file) {
    $path = [IO.Path]::GetDirectoryName($path)
  }

  $env:PATH += [String]::Format(";{0}", $path)
}

<#
.SYNOPSIS
  Gets the path of gvim via the windows registry.
  Assumes the path can be found via hklm:\software\vim\gvim
  Returns the path as a quoted string.
#>
function get-vimpath() {
  $key = "hklm:\software\vim\gvim"
  return [String]::Format("`"{0}`"", (get-itemproperty $key).path)
}

<#
.SYNOPSIS
  Will set the mingw runtime to be on the system path.
.EXAMPLE
 [@]:~/$ set-mingw
#>
function set-mingw () {
  $env:PATH += ";C:\MinGW\bin"
}

<#
.SYNOPSIS
  Creates constant read-only values in the global scope
.NOTES
  Used primarily for 'caching' values
#>
function set-constant($name, $value, [string]$description='') {
  set-variable -name $name `
    -option constant `
    -value $value `
    -scope global `
    -description $description `
}

<# This should probably go into a utility module as well
Additionally, making all the environment values constants would help
out a great deal, I'm sure

use `set-variable <varname> -option Constant -value <value>`
#>
function set-vars {
  set-constant username ([Environment]::UserName.ToLower())
  set-constant machinename ([Environment]::MachineName.ToLower())
}
