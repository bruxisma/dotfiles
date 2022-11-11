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
function msvc([int]$version=10, [string]$type='x86') {
  $env_var = 'VS' + $version + '0COMNTOOLS'
  $vs_tools = [environment]::GetEnvironmentVariable($env_var, 'Machine')
  $run_string = '"' + $vs_tools + '..\..\VC\vcvarsall.bat' + '" ' + $type + ' & set'
  cmd.exe /c $run_string | foreach-object {
      $p, $v = $_.split('=')
      set-item -path env:$p -value $v
  }
}

function prompt {
  write-host ('[' + [environment]::UserName + '@' +
              [environment]::MachineName.ToLower() + ']:' +
              (pwd).Path.Replace($HOME, '~') + '$') -NoNewline
  return ' '
}

# run garbage collection
function run-gc() { [void]([System.GC]::Collect()) }

#set-location $HOME
msvc 10
