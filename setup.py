#!/usr/bin/env python3
# Installs the files and folders to $HOME via symlinks
# Might be considered hackish and bruteforced
# Assumes it is run as ./install

# Errors out if it can't clean up symlinks, or directories.
# Needs to be run as administrator or with the privelege to create symlinks on
# windows. this script will not work on Windows XP, as I don't work on Windows
# XP

from glob import glob

import sys
import os

dotfile_list = glob('*rc')
ps_list = glob('*.ps1')
dir_list = ['vim']

def symlink(iterable, func, directory=False):
    ''' Given an iterable of filenames, and a func that takes a string, and
    returns the expected formatted version, create symlinks to all files within
    the iterable. (If the iterable is full of directories, set directory to
    True)

    Will cause a complete exit with an error code of 1 if the symlink fails.
    Will cause a complete exit with an error code of 2 if the symlink already
    exists and could not be removed.
    '''
    for item in iterable:
        link = os.path.expanduser(os.path.join('~', func(item)))
        print('{} -> {}'.format(item, link))
        if not directory and os.path.exists(link)
            try: os.remove(link)
            except OSError as e:
                print('Could not remove old symlink {}: {}'.format(link, e))
                sys.exit(2)
        try: os.symlink(item, link, target_is_directory=directory)
        except OSError as e:
            print('Could not symlink {}: {}'.format(item, e))
            sys.exit(1)

if __name__ == '__main__':
    # Hacky way to remove zsh stuff from being symlinked in windows
    dotfile_list = [item for item in dotfile_list
            if 'zsh' not in item and sys.platform == 'win32']
    # Now we do the actual symlinking
    symlink(dotfile_list,
        lambda x: '{}{}'.format('.' if sys.platform != 'win32' else '_', x))
    symlink(dir_list,
        lambda x: ('{}files' if sys.platform != 'win32' else '.{}').format(x),
        directory=True)
    # Powershell stuff is last, since it is _only_ for windows
    if sys.platform == 'win32':
        temp = os.path.join('~', 'Documents', 'WindowsPowershell')
        path = os.path.expanduser(temp)
        os.makedirs(path, exist_ok=True)
        symlink(ps_list,
            lambda x: os.path.join('Documents', 'WindowsPowershell', x))
