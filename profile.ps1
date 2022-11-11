# powershell initialization script
# Should be autoloaded
# . "$env:HOME\profile.ps1"
#

# Set the $HOME variable to make powershell recognize ~/ as $HOME


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
  $key = "hklm:\software\classes\applications\gvim.exe\shell\edit\command"
  $command = (get-itemproperty $key).'(default)'
  return "`"" + $command.Replace("`"", "").Split("%")[0].TrimEnd() + "`""
}

<#
.SYNOPSIS
  Gets the Python location, and sets its folder AND \Scripts
  to be on the system PATH. Default value is Python 3.2
#>
function set-python([float]$version=3.2) {
  $key = "hklm:\software\python\pythoncore\{0}\installpath"
  $key = [String]::Format($key, $version)
  $path = (get-itemproperty $key).'(default)'

  # Build the path out properly
  $path = [String]::Format(";{0};{1}Scripts", $path, $path)
  $env:PATH = $env:PATH + $exe_path
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
