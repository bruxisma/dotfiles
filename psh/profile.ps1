# Personal configuration profile

import-module development
import-module posix

$env:EDITOR = get-vimpath

set-location $HOME
set-python
set-mingw
set-msvc
set-vars # Sets global constant values.


# A little bit of cross-platform naming conventions
set-alias less more
set-alias python3 python
set-alias open explorer

# "boilerplate"
$window = (get-host).UI.RawUI
$window.BackgroundColor = "black"
clear-host

function prompt {
  $root = (pwd).Path
  $drive = $root.LastIndexOf(':') + 1
  $user = $HOME.SubString($drive)
  $path = $root.SubString($drive).Replace($user, '~').Replace('\', '/')

  [String]::Format('[{0}@{1}]:{2}$', $username, $machinename, $path) |
  write-host -nonewline

  return ' '
}
