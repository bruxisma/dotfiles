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
  Gets the (default) Python location, and sets its folder AND \Scripts
  to be on the system PATH.
  NOTE: Assumes that the Python.File\shell\open\command value doesn't have
  anything weird it in (i.e., splitting the string by a \ will make it
  place all non-important portions of the path at the end
#>
function set-python() {
  $key = "python.file\shell\open\command"
  $temp = new-object system.collections.generic.list[string]
  $root = [Microsoft.Win32.RegistryHive]::ClassesRoot
  $reg_key = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey($root, "")
  $value = $reg_key.OpenSubKey($key).GetValue("")
  $temp.AddRange($value.Split("\"))
  $temp.RemoveAt($temp.Count - 1)
  # This replaces the first quote with a semi-colon which we need
  # for adding to the PATH
  $exe_path = [String]::Join("\", $temp).Replace("`"", ";")
  $scr_path = $exe_path + "\Scripts"
  $env:PATH = $env:PATH + $exe_path + $scr_path
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
