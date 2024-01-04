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

from pathlib import Path

#-----------------------------------------------------------------------------
# Globals
#-----------------------------------------------------------------------------
windows = sys.platform == 'win32'
posix = not windows

CONFIG_HOME = Path(os.environ.get('XDG_CONFIG_HOME', '~/.config')).expanduser()
APPDATA = Path(os.environ.get('APPDATA', '~/.config')).expanduser()

head = '~/Documents' if windows else CONFIG_HOME
shell_target = Path(head).expanduser().joinpath('powershell')
shell = 'pwsh'

def symlink_to(src, dst):
    src = Path.cwd().joinpath(src)
    dst = Path(dst).expanduser()
    dst.unlink(missing_ok=True)
    print(f'{src} -> {dst}')
    dst.symlink_to(src, target_is_directory=src.is_dir())


#-----------------------------------------------------------------------------
# Setup
#-----------------------------------------------------------------------------
def gitsetup ():
    '''sets local files for git usage'''
    try: call(['git', 'update-index', '--skip-worktree', '--', 'pwsh/machine.ps1', 'git/machine'])
    except CalledProcessError as e: exit(str(e))

def symsetup ():
    '''creates configuration symlinks'''
    CONFIG_HOME.mkdir(mode=0o755, exist_ok=True)

    symlink_to('nvim', CONFIG_HOME.joinpath('nvim'))
    symlink_to('git', CONFIG_HOME.joinpath('git'))
    symlink_to('lsd', APPDATA.joinpath('lsd'))
    symlink_to('oh-my-posh', CONFIG_HOME.joinpath('oh-my-posh'))

    symlink_to('pwsh', shell_target)
    symlink_to('gh', CONFIG_HOME.joinpath('gh'))
    symlink_to('erdtree', CONFIG_HOME.joinpath('erdtree'))

    if sys.platform == 'win32':
        symlink_to("wt/Fragments", f'{os.environ["LOCALAPPDATA"]}/Microsoft/Windows Terminal/Fragments')

    # TODO: need to figure out if fragments can represent the entire settings.json file, or *just* profiles.
    #symlink('wt/fragments', f'{os.environ["LOCALAPPDATA"]}\Microsoft\Windows Terminal\Fragments')
    #symlink('wt/settings.json', ...) # The path to the Windows Terminal settings file is not the best


#-----------------------------------------------------------------------------
# Entry Point
#-----------------------------------------------------------------------------
if __name__ == '__main__':
    gitsetup()
    symsetup()
