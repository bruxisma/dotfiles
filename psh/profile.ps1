# Personal configuration profile
function test-windows { ($PSEdition -eq "Desktop") -or $IsWindows }
function test-macos { -not ($PSEdition -eq "Desktop") -and $IsOSX }
function test-linux { -not ($PSEdition -eq "Desktop") -and $IsLinux }

function test-file ([string]$path) { test-path -pathtype leaf $path }

function get-hostname {
  $name = [System.Net.Dns]::GetHostName().ToLower()
  $index = $name.IndexOf('.')
  if ($index -lt 0) { $index = $name.Length }
  return $name.SubString(0, $index)
}

function get-username {
  if (test-windows) { return $env:USERNAME.ToLower() }
  $env:USER
}

function append-path ([string]$path) {
  $path = $path.Replace('"', "") #XXX: Why is this here?
  if (-not (test-path $path)) { return }
  if (test-file $path) {
    $path = [IO.Path]::GetDirectoryName($path)
  }
  if ($env:PATH.Contains($path)) { return }
  $env:PATH += ';{0}' -f $path
}

#function invoke-gdb {
#  & gdb -nh -x $env:XDG_CONFIG_HOME/gdb/init
#}

function reload-profile { . $PROFILE.CurrentUserAllHosts }

$env:EDITOR = (Get-ItemProperty HKLM:\SOFTWARE\Vim\Gvim\).Path

# XDG environment variables
$env:XDG_CONFIG_HOME = $env:APPDATA
$env:XDG_CACHE_HOME = $env:LOCALAPPDATA
$env:XDG_DATA_HOME = $env:APPDATA
$env:XDG_RUNTIME_DIR = $env:TEMP

#$env:NPM_CONFIG_USERCONFIG = $env:XDG_CONFIG_HOME/npm/npmrc
#$env:INPUTRC = $env:XDG_CONFIG_HOME/readline/inputrc
#
#$env:RUSTUP_HOME = $env:XDG_DATA_HOME/rustup
#$env:CARGO_HOME = $env:XDG_DATA_HOME/cargo
#
#$env:PYTHON_EGG_CACHE = $env:XDG_CACHE_HOME/python-eggs
#$env:__GL_SHADER_DISK_CACHE_PATH=$env:XDG_CACHE_HOME/nv
#$env:CUDA_CACHE_PATH = $env:XDG_CACHE_PATH/nv

if (test-file $env:XDG_CONFIG_HOME/vim/vimrc) {
  # TODO: Consider placing the $MYVIMRC assignment inside the actual vimrc file?
  $env:VIMINIT = 'let $MYVIMRC = "$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC"'
}

#set-alias gdb invoke-gdb

append-path 'C:\MinGW\bin'
append-path $env:EDITOR
#append-path $env:CARGO_HOME/bin

# A little bit of cross-platform naming conventions
if (test-windows) {
  set-alias less more
  set-alias open explorer
}

# "boilerplate"
set-location $HOME

$window = (get-host).UI.RawUI
$window.BackgroundColor = "black"
#clear-host

# Does not yet work :/
#function Set-PosixLocation {
#  if (-not $args.Length) {
#    return (set-location $HOME)
#  }
#  set-location $args
#}
#
#remove-item alias:cd
#set-alias cd set-posixlocation

function prompt {
  set-variable -Name username -Value (get-username) -Option Private
  set-variable -Name hostname -Value (get-hostname) -Option Private
  $location = get-location
  $path = $location.Path.Replace($HOME, '~')
  if (test-windows) {
    $path = $path.Replace($location.Drive.Root, '/').Replace('\', '/')
  }

  '[{0}@{1}]:{2}$ ' -f $username,$hostname,$path
}
