#!/usr/bin/env python3
# Installs dotfiles and shell profiles to $HOME via symlinks
# Assumes it is run as python setup.py

# Errors out if it can't clean up previous symlinks, or directories.
# TODO: This could be converted to a setup.ps1 file for powershell
# This would then let us `source` the profile after symlinking

#-----------------------------------------------------------------------------
# Imports
#-----------------------------------------------------------------------------
from subprocess import CalledProcessError
from subprocess import check_call as call

from functools import partial

from os.path import islink, isdir, join

from sys import platform, exit

import sys
import os

#-----------------------------------------------------------------------------
# Globals
#-----------------------------------------------------------------------------
windows = sys.platform == 'win32'
posix = not windows

head = 'Documents' if windows else '.config'
shell_target = join(head, 'powershell')
shell = 'pwsh'

#-----------------------------------------------------------------------------
# Functions
#-----------------------------------------------------------------------------
def symlink (src, dst):
    '''Given a *src* and a *dst*, creates a symlink from *src* to *dst*.
    If the given *dst* already exists it will attempt to remove the old symlink
    and create a new one.

    Exits with an error message if any symlink fails
    '''
    link = os.path.expanduser(join('~', dst))
    item = join(os.getcwd(), src)
    print('{} -> {}'.format(item, link))
    if islink(link):
        try: os.unlink(link)
        except OSError as e:
            exit('Could not remove old symlink {}: {}'.format(link, e))
    linker = partial(os.symlink, item, link)
    if windows: linker = partial(linker, target_is_directory=isdir(item))
    try: linker()
    except OSError as e: exit('Could not symlink {}: {}'.format(item, e))

#-----------------------------------------------------------------------------
# Setup
#-----------------------------------------------------------------------------
def gitsetup ():
    '''sets local files for git usage'''
    try: call(['git', 'update-index', '--assume-unchanged', 'pwsh/Machine.ps1'])
    except CalledProcessError as e: exit(str(e))


def symsetup ():
    '''creates configuration symlinks'''
    os.makedirs(os.path.expanduser('~/.config'), mode=0o755, exist_ok=True)

    symlink('gvimrc', '.gvimrc')
    symlink('vimrc', '.vimrc')
    symlink('vim', '.vim')
    symlink('git', join('.config', 'git'))
    symlink(shell, shell_target)

#-----------------------------------------------------------------------------
# Entry Point
#-----------------------------------------------------------------------------
if __name__ == '__main__':
    gitsetup()
    symsetup()
