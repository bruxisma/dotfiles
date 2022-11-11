# Personal configuration profile
function Test-Windows { ($PSEdition -eq "Desktop") -or $IsWindows }
function Test-MacOS { -not ($PSEdition -eq "Desktop") -and $IsOSX }
function Test-Linux { -not ($PSEdition -eq "Desktop") -and $IsLinux }

function Test-File ([String]$Path) { Test-Path -PathType Leaf $Path }

function Get-XDGConfigHome {
  if (Test-Windows) { return $env:APPDATA }
  if (Test-MacOS) { return "$HOME/Library/Application Support" }
  "$HOME/.config"
}

function Get-XDGCacheHome {
  if (Test-Windows) { return $env:LOCALAPPDATA }
  "$HOME/.cache"
}

function Get-HostName {
  $name = [System.Net.Dns]::GetHostName().ToLower()
  $index = $name.IndexOf('.')
  if ($index -lt 0) { $index = $name.Length }
  $name.SubString(0, $index)
}

function Get-UserName {
  if (Test-Windows) { return $env:USERNAME.ToLower() }
  $env:USER.ToLower()
}

function Append-Path ([String]$Path) {
  if (Test-File $Path) { $Path = [IO.Path]::GetDirectoryName($Path) }
  if (-not (Test-Path $Path)) { return }
  if ($env:PATH.Contains($Path)) { return }
  if (-not $env:PATH.EndsWith(";")) { $Path = $Path.Insert(0, ';') }
  $env:PATH += $Path
}

function Prepend-Path ([String]$Path) {
  if (Test-File $Path) { $Path = [IO.Path]::GetDirectoryName($Path) }
  if (-not (Test-Path $Path)) { return }
  if ($env:PATH.Contains($Path)) { return }
  $env:PATH.Insert(0, ('{0};' -f $Path))
}

#function invoke-gdb {
#  & gdb -nh -x $env:XDG_CONFIG_HOME/gdb/init
#}

function Reload-Profile { . $PROFILE.CurrentUserAllHosts }

$env:EDITOR = (Get-ItemProperty HKLM:\SOFTWARE\Vim\Gvim\).Path

# XDG environment variables
if (Test-Windows) {
  $env:XDG_CONFIG_HOME = $env:APPDATA
  $env:XDG_CACHE_HOME = $env:LOCALAPPDATA
  $env:XDG_DATA_HOME = $env:APPDATA
  $env:XDG_RUNTIME_DIR = $env:TEMP
}

#$env:NPM_CONFIG_USERCONFIG = $env:XDG_CONFIG_HOME/npm/npmrc
#$env:INPUTRC = $env:XDG_CONFIG_HOME/readline/inputrc
#
#$env:RUSTUP_HOME = $env:XDG_DATA_HOME/rustup
#$env:CARGO_HOME = $env:XDG_DATA_HOME/cargo
#
#$env:PYTHON_EGG_CACHE = $env:XDG_CACHE_HOME/python-eggs
#$env:__GL_SHADER_DISK_CACHE_PATH=$env:XDG_CACHE_HOME/nv
#$env:CUDA_CACHE_PATH = $env:XDG_CACHE_PATH/nv

if (Test-File $env:XDG_CONFIG_HOME/vim/vimrc) {
  $env:VIMINIT = 'let $MYVIMRC = "$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC"'
}

#set-alias gdb invoke-gdb

append-path 'C:\MinGW\bin'
append-path $env:EDITOR
#append-path $env:CARGO_HOME/bin

# A little bit of cross-platform naming conventions
if (test-windows) {
  set-alias less more # Hates UTF8 codepage. Need a replacement!
  set-alias open explorer
  set-alias help get-help
  set-alias which get-command
}

# "boilerplate"

# TODO: This needs to be changed *for sure*. It is NOT helpful in most cases
$window = (get-host).UI.RawUI
$window.BackgroundColor = "black"
clear-host

Set-PSReadlineOption -BellStyle None

if (Test-Windows) { Add-WindowsPSModulePath }

# TODO: Make $path be green.
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
