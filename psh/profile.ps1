# Personal configuration profile

import-module development

# Set up the powershell prompt
# We start in ~/ at all times. ALWAYS D:<
set-location $HOME
# At some point there will be a 'python' module which will use stuff like
# virtualenv, and act as virtualenv wrapper tools and stuff.
set-python
# We also want msvc set to VS2010 by default, with amd64.
# There is nothing wrong with us calling
# `set-msvc [some other version] [some other toolchain]`
# as it will just overwrite it :)
set-msvc

# both git and mercurial will use the $EDITOR value in powershell, so
# we get the actual path and set it.
$env:EDITOR = get-vimpath

# Blue is nice, but it messes with some of my programs :/
$window = (get-host).UI.RawUI
$window.BackgroundColor = "black"
clear-host
