# powershell initialization script
# Should be autoloaded
# . "$env:HOME\profile.ps1"
#

# Set the $HOME variable to make powershell recognize ~/ as $HOME

# set-variable -name HOME -value (resolve-path '$env:HOME') -force
#(get-psprovider FileSystem).Home = $HOME
$SCRIPTS = '$HOME\scripts'
$env:EDITOR = 'gvim.exe'
<#
.SYNOPSIS
  Invokes a particular visual studio batch file, while keeping all of the
  system settings.
.PARAMETER version
  The visual studio version (i.e., Visual Studio 2010 = 10)
.PARAMETER $type
  The compiler suite to use. (either x86 or amd64)
.EXAMPLE
  [@]:~\$ msvc 9
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

function prompt {
  write-host ('[' + [environment]::UserName + '@' +
              [environment]::MachineName.ToLower() + ']:' +
              (pwd).Path.Replace('\', '/').Replace($HOME, '~') +'$') -NoNewline
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

# Blue is nice, but it messes with some of my programs :/
$window = (get-host).UI.RawUI
$window.BackgroundColor = "black"
clear-host
