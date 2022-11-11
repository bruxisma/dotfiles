# Personal configuration profile

import-module development
import-module posix

$env:EDITOR = get-vimpath

set-location $HOME
set-python
set-msvc
set-vars # Sets global constant values.

set-alias less more
set-alias python3 python

# "boilerplate"
$window = (get-host).UI.RawUI
$window.BackgroundColor = "black"
clear-host

function prompt {
  $path = (pwd).Path.Replace($HOME, '~').Replace('\', '/')

  [String]::Format('[{0}@{1}]:{2}$', $username, $machinename, $path) |
  write-host -nonewline

  return ' '
}
