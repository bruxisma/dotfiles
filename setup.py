#!/usr/bin/env python
# Installs the files and folders to $HOME via symlinks
# Assumes it is run as python setup.py
# Requires Python 3 for Windows use

# Errors out if it can't clean up symlinks, or directories.
# Needs to be run as administrator to create symlinks on Windows
# This script will not work on Windows XP

from __future__ import print_function

from functools import partial

import sys
import os

def symlink(src, dst):
    '''Given a *src* and a *dst*, creates a symlink fro *src* to *dst*.
    If the given *dst* already exists as a symlink (and is not a directory),
    it will attempt to remove the old symlink and create a new one.

    Will exit with an error code of 1 if a given symlink fails
    Will exit with an error code of 2 if a given symlink could not be relinked.
    '''
    link = os.path.expanduser(os.path.join('~', dst))
    item = os.path.join(os.getcwd(), src)
    print('{} -> {}'.format(item, link))
    if not os.path.isdir(item) and os.path.islink(link):
        try: os.remove(link)
        except OSError as e:
            print('Could not remove old symlink {}: {}'.format(link, e))
            sys.exit(2)
    linker = partial(os.symlink, item, link)
    if sys.platform == 'win32':
        linker = partial(linker, target_is_directory=os.path.isdir(item))
    try: linker()
    except OSError as e:
        print('Could not symlink {}: {}'.format(item, e))
        sys.exit(1)


if __name__ == '__main__':
    front = '.'
    shell = 'fish'
    target = os.path.join('.config', 'fish')

    if sys.platform == 'win32':
        front = '_'
        shell = 'psh'
        target = os.path.join('Documents', 'WindowsPowershell')

    symlink('gvimrc', '{}gvimrc'.format(front))
    symlink('vimrc', '{}vimrc'.format(front))
    symlink('vim', '{}vim'.format(front))
    symlink(shell, target)
