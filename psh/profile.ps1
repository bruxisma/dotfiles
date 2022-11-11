# powershell initialization script
# Should be autoloaded
# . "$env:HOME\profile.ps1"
#

# Set the $HOME variable to make powershell recognize ~/ as $HOME

<#
.SYNOPSIS
  returns True or False depennding on whether or not a given registry key
  exists. (Uses get-itemproperty)
#>
function test-registry([string]$key) {
  try { get-itemproperty $key -erroraction stop }
  catch [Exception] { return $false }
  return $true
}

<#
.SYNOPSIS
  Gets the path of gvim via the windows registry.
  It assumes the path is found at 
  hklm:\software\classes\applications\gvim.exe\shell\edit\command
.EXAMPLE
  []:~\$ get-vimpath
  []:~\$ "C:\My\vim\installation\"
#>
function get-vimpath() {
  $key = "hklm:\software\vim\gvim"
  return [String]::Format("`"{0}`"", (get-itemproperty $key).path)
}

<#
.SYNOPSIS
  Gets the Python location, and sets its folder AND \Scripts
  to be on the system PATH. Default value is Python 3.2
  This checks for both 32 and 64 bit python versions, but assumes that all
  python versions are of the same bit (32 or 64)
#>
function set-python([float]$ver=3.2) {
  $root_pre = "hklm:\software\{0}"
  $test = [String]::Format($root_pre, "python")
  if (test-registry $test) { $root_pre = $test }
  else { $root_pre = [String]::Format($root_pre, "wow6432node\python") }
  $key = [String]::Format("{0}\pythoncore\{1}\installpath", $root_pre, $ver)
  $path = (get-itemproperty $key).'(default)'

  # Build the path out properly
  $env:PATH = $env:PATH + [String]::Format(";{0};{0}Scripts", $path)
}

<#
.SYNOPSIS
  Invokes a particular visual studio batch file, while keeping all of the
  system settings.
.PARAMETER version
  The visual studio version (i.e., Visual Studio 2010 = 10)
.PARAMETER $type
  The compiler suite to use. (either x86 or amd64)
.EXAMPLE
  [@]:~\$ set-msvc 9
.NOTES
  Parts of this function are taken from stack overflow and Lee Holmes.
#>
function set-msvc([int]$version=10, [string]$type='x86') {
  $env_var = 'VS' + $version + '0COMNTOOLS'
  $vs_tools = [environment]::GetEnvironmentVariable($env_var, 'Machine')
  $vc_path = '..\..\VC\vcvarsall.bat'
  $run_string = '"' + $vs_tools + $vc_path + '" ' + $type + ' & set'
  cmd.exe /c $run_string | foreach-object {
      $p, $v = $_.split('=')
      set-item -path env:$p -value $v
  }
}

# This obviously modifies the prompt (I would like to change the tab completion
# to use forward slashes but oh well :/)
function prompt {
  write-host ('[' + [environment]::UserName.ToLower() + '@' +
              [environment]::MachineName.ToLower() + ']:' +
              (pwd).Path.Replace($HOME, '~').Replace('\', '/') +'$') -NoNewline
  return ' '
}

# run garbage collection
function run-gc() { [void]([System.GC]::Collect()) }

# Set up the powershell prompt
# We start in ~/ at all times. ALWAYS D:<
# We also want msvc set to VS2010 by default, with x86. There is nothing wrong
# with us calling set-msvc [some other version] [some other toolchain]
# as it will just overwrite it :)
set-location $HOME
set-msvc 10 x86
set-python

# both git and mercurial will use the $EDITOR value in powershell, so
# we get the actual path and set it.
$env:EDITOR = get-vimpath

# Blue is nice, but it messes with some of my programs :/
$window = (get-host).UI.RawUI
$window.BackgroundColor = "black"
clear-host
