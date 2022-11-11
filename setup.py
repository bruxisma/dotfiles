#!/usr/bin/env python3
# Installs the files and folders to $HOME via symlinks
# Might be considered hackish and bruteforced
# Assumes it is run as ./install

# Errors out if it can't clean up symlinks, or directories.
# Needs to be run as administrator or with the privelege to create symlinks on
# windows. this script will not work on Windows XP (and really who the hell
# is using XP in this day and age? :/)


from glob import glob

import sys
import os

dotfile_list = glob('*rc')
ps_list = glob('*.ps1')
dir_list = ['vim']

def symlink(source, path, directory=False):
    ''' Given a source and 'output name', will symlink the source to
    the output name such that it is connected to the $HOME
    '''
    link = os.path.expanduser(os.path.join('~', path))
    print('{} -> {}'.format(source, link))
    #try: os.symlink(source, link, target_is_directory=directory)
    #except OSError as e:
    #    print('Could not symlink {}'.format(e))
    #    sys.exit(1)

if __name__ == '__main__':
    # We do the dotfiles first
    # Hacky way to remove zsh stuff from being symlinked in windows
    dotfile_list = [item for item in dotfile_list
            if 'zsh' not in item and sys.platform == 'win32']
    for dot in dotfile_list:
        out = '{}{}'.format('.' if sys.platform != 'win32' else '_', dot)
        symlink(dot, out)
    # now move the directories
    for dir in dir_list:
        out = ('{}files' if sys.platform == 'win32' else '.{}').format(dir)
        symlink(dir, out, directory=True)
    # We do powershell stuff last since it is only for windows.
    if sys.platform == 'win32':
        temp = os.path.join('~', 'Documents', 'WindowsPowershell')
        path = os.path.expanduser(temp)
        os.makedirs(path, exist_ok=True)
        for ps in ps_list:
            out = os.path.join('Documents', 'WindowsPowershell', ps)
            symlink(ps, out)
        
        
