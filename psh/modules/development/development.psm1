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
  Gets the path of gvim via the windows registry.
  Assumes the path vcan be found via hklm:\software\vim\gvim
  Returns the path as a quoted string.
#>
function get-vimpath() {
  $key = "hklm:\software\vim\gvim"
  return [String]::Format("`"{0}`"", (get-itemproperty $key).path)
}

<#
.SYNOPSIS
  Gets the Python location, and sets its folder AND the Scripts folder to be
  on the system PATH. Default value is CPython 3.2
  This checks for both 32-bit and 64-bit python versions, but assumes that
  all python versions installed are all either 32-bit or 64-bit.
  Undefined behavior results otherwise
.PARAMETER $version
  The python version to set as the 'primary' tool. Must be a float
.EXAMPLE
  [@]:~/$ set-python 3.2
#>
function set-python([float]$version=3.2) {
  $root = "hklm:\software\{0}"
  $test = [String]::Format($root, "python")
  if (test-registry $test) { $root = $test }
  else { $root = [String]::Format($root, "wow6432node\python") }
  $key = [String]::Format("{0}\pythoncore\{1}\installpath", $root, $version)
  $path = (get-itemproperty $key).'(default)'

  # Builds the path out properly
  $env:PATH += [String]::Format(";{0};{0}Scripts", $path)
}

<#
.SYNOPSIS
  Invokes a particular visual studio batch file, and setting the system PATH
  changes to stay for the current session.
.PARAMETER $version
  The visual studio version as an integer (e.g., Visual Studio 2010 = 10)
.PARAMETER $type
  The compiler toolchain to use (x86, amd64, arm, etc.)
.EXAMPLE
  [@]:~/$ set-msvc 10 x86
.NOTES
  Parts of this function are taken from stack overflow and Lee Holmes.
  The default values are VS2012 and the amd64 toolchain.
#>
function set-msvc([int]$version=11, [string]$type="x86") {
  $env_var = [String]::Format("VS{0}0COMNTOOLS", $version)
  $tools = [Environment]::GetEnvironmentVariable($env_var, "Machine")
  $path = "..\..\vc\vcvarsall.bat"
  $run = [String]::Format("`"{0}{1}`" {2} & set", $tools, $path, $type)
  cmd.exe /c $run | foreach-object {
    $key, $value = $_.Split('=')
    set-item -path env:$key -value $value
  }
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
