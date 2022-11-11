#!/usr/bin/env python3
# Installs dotfiles and shell profiles to $HOME via symlinks
# Assumes it is run as python setup.py

# Errors out if it can't clean up previous symlinks, or directories.

#-----------------------------------------------------------------------------
# Imports
#-----------------------------------------------------------------------------
from __future__ import print_function

from subprocess import CalledProcessError
from subprocess import check_call as call

from functools import partial

from argparse import ArgumentDefaultsHelpFormatter, ArgumentParser
from argparse import Action

from os.path import expanduser as expand
from os.path import islink, isdir, join

from sys import platform, exit

from os import symlink as symbolic_link
from os import mkdir as make_directory
from os import unlink, remove, getcwd, path

#-----------------------------------------------------------------------------
# Classes
#-----------------------------------------------------------------------------
class ExecuteAction(Action):
  pass

#-----------------------------------------------------------------------------
# Globals
#-----------------------------------------------------------------------------
windows = platform == 'win32'
posix = not windows

head = 'Documents' if windows else '.config'
shell_target = join(head, 'powershell')
shell = 'pwsh'

#-----------------------------------------------------------------------------
# Functions
#-----------------------------------------------------------------------------
def gitclear (section):
    '''Given a *section*, removes all members of that section.

    Exits with an error message if the call fails
    '''
    cmd = ['git', 'config', '--global', '--remove-section', '{}'.format(section)]
    try: call(cmd)
    except CalledProcessError as e: exit(str(e))

def gitconfig (section, variable, value):
    '''Given a *section*, *variable*, and *value*, adds the *variable* to the
    global .gitconfig with *value*. This is done instead of adding a .gitconfig
    file to the repo because some settings need to change on a per machine basis

    Exits with an error message if any call fails
    '''
    cmd = ['git', 'config', '--global',
        '{}.{}'.format(section, variable),
        value]
    try: call(cmd)
    except CalledProcessError as e: exit(str(e))

def gitalias (**kwargs):
    for key, value in kwargs.items():
      gitconfig('alias', key, value)

def mkdir (path):
    '''Creates a directory *path*, after performing file path expansion. Does
    nothing if *path* already exists.
    
    Exits with an error message if it cannot create the directory
    '''
    path = expand(path)
    if isdir(path): return
    try: make_directory(path)
    except OSError as e: exit(str(e))

def symlink (src, dst):
    '''Given a *src* and a *dst*, creates a symlink from *src* to *dst*.
    If the given *dst* already exists it will attempt to remove the old symlink
    and create a new one.

    Exits with an error message if any symlink fails
    '''
    link = expand(join('~', dst))
    item = join(getcwd(), src)
    print('{} -> {}'.format(item, link))
    if path.islink(link):
        try: unlink(link)
        except OSError as e:
            exit('Could not remove old symlink {}: {}'.format(link, e))
    linker = partial(symbolic_link, item, link)
    if windows: linker = partial(linker, target_is_directory=isdir(item))
    try: linker()
    except OSError as e: exit('Could not symlink {}: {}'.format(item, e))

#-----------------------------------------------------------------------------
# Setup
#-----------------------------------------------------------------------------
def aliassetup ():
    '''creates git aliases'''
    # This is a very large git alias, so we break it up for readability
    aliases = ' | '.join((r'!git config --get-regexp "^alias[.]"',
        r'rg -e "^alias[.](\w+) " -r "\$1#"'
        r'sort',
        r'column -t -s "#"'))

    gitclear('alias')

    gitalias(aliases=aliases)
    gitalias(branches='branch -a')
    gitalias(commits='log --graph --decorate --pretty=oneline --abbrev-commit')
    gitalias(stashes='stash list')
    gitalias(remotes='remote -v')
    gitalias(summary='status -s')
    gitalias(tags='tag')

    gitalias(squash='commit --squash')
    gitalias(fixup='commit --fixup')

    gitalias(history='commits --all')
    gitalias(root='rev-parse --shot-toplevel')
    gitalias(stat='status')
    gitalias(st='status')

def gitsetup ():
    '''creates gitconfig variables'''
    gitconfig('rebase', 'autosquash', 'true')
    try: call(['git', 'update-index', '--assume-unchanged', 'pwsh/Machine.ps1'])
    except CalledProcessError as e: exit(str(e))


def symsetup ():
    '''creates configuration symlinks'''
    if posix: mkdir('~/.config')

    symlink('gvimrc', '.gvimrc')
    symlink('vimrc', '.vimrc')
    symlink('vim', '.vim')
    symlink(shell, shell_target)

def allsetup ():
    '''runs all setup steps'''
    aliassetup()
    toolsetup()
    gitsetup()
    symsetup()

#-----------------------------------------------------------------------------
# Entry Point
#-----------------------------------------------------------------------------
if __name__ == '__main__':
    parser = ArgumentParser(formatter_class=ArgumentDefaultsHelpFormatter)
    argument = partial(parser.add_argument, action='store_true')

    argument('--alias', help='gitconfig aliases only')
    argument('--git', help='gitconfig only')
    argument('--sym', help='symlink only')

    # if no options are specified, all options are run
    args = vars(parser.parse_args())
    if not any(args.values()): args = dict.fromkeys(args, True)

    alias = args['alias']
    git = args['git']
    sym = args['sym']

    if alias: aliassetup()
    if git: gitsetup()
    if sym: symsetup()

