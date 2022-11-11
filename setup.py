#!/usr/bin/env python
# Installs the files and folders to $HOME via symlinks
# Assumes it is run as python setup.py
# Requires Python 3 for Windows use

# Errors out if it can't clean up symlinks, or directories.
# Needs to be run as administrator to create symlinks on Windows.
# When run from PowerShell, use 'su' which works as one might expect it to.

#-----------------------------------------------------------------------------
# Imports
#-----------------------------------------------------------------------------
from __future__ import print_function

from subprocess import CalledProcessError
from subprocess import check_call as call

from functools import partial

from argparse import ArgumentDefaultsHelpFormatter
from argparse import ArgumentParser

from os.path import expanduser as expand
from os.path import islink
from os.path import isdir
from os.path import join

from sys import platform
from sys import exit

from os import symlink as symbolic_link
from os import mkdir as make_directory
from os import getcwd
from os import remove

#-----------------------------------------------------------------------------
# Globals
#-----------------------------------------------------------------------------
windows = platform == 'win32'
posix = not windows

head = 'Documents' if windows else '.config'
tail = 'WindowsPowershell' if windows else 'fish'
shell_target = join(head, tail)
shell = 'psh' if windows else 'fish'

# This is a very large git alias, so we break it up for readability
aliases = ' | '.join((r'!git config --get-regexp "^alias\\."',
  r'sed -e "s/^alias\\.\([^\ ]*\)\ /\1#/"',
  r'sort',
  r'column -t -s "#"'))

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
  cmd = ['git', 'config', '--global', '{}.{}'.format(section, variable), value]
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
  '''Given a *src* and a *dst*, creates a symlink fro *src* to *dst*.
  If the given *dst* already exists as a symlink (and is not a directory),
  it will attempt to remove the old symlink and create a new one.

  Exits with an error message if any symlink fails
  '''
  link = expand(join('~', dst))
  item = join(getcwd(), src)
  print('{} -> {}'.format(item, link))
  if not isdir(item) and islink(link):
    try: remove(link)
    except OSError as e:
      exit('Could not remove old symlink {}: {}'.format(link, e))
  linker = partial(symbolic_link, item, link)
  if windows: linker = partial(linker, target_is_directory=isdir(item))
  try: linker()
  except OSError as e: exit('Could not symlink {}: {}'.format(item, e))

def gitsetup ():
  gitconfig('user', 'name', 'Isabella Muerte')

  gitconfig('push', 'default', 'simple')

  gitconfig('core', 'autocrlf', 'input')
  gitconfig('core', 'editor', 'gvim -f')

  gitconfig('color', 'ui', 'auto')

  gitconfig('log', 'date', 'iso')

  gitclear('alias')

  gitalias(aliases=aliases)
  gitalias(branches='branch -a')
  gitalias(commits='log --graph --decorate --pretty=oneline --abbrev-commit')
  gitalias(stashes='stash list')
  gitalias(remotes='!git remote -v | column -t')
  gitalias(changes='status -s')
  gitalias(tags='tag')

  gitalias(unshelve='stash pop')
  gitalias(uncommit='reset --mixed @~')
  gitalias(unstage='reset -q @ --')
  gitalias(undo='reset --soft @~1')

  gitalias(squash='commit --squash')
  gitalias(fixup='commit --fixup')
  gitalias(cram='rebase -i --autosquash')

  gitalias(current='rev-parse --abbrev-ref @')
  gitalias(history='!git commits --all')
  gitalias(discard='checkout --')
  gitalias(shelve='stash save --include-untracked')
  gitalias(update='add -A')
  gitalias(track='branch -u')
  gitalias(shove='push -f')
  gitalias(head='rev-list --max-count=1 --abbrev-commit @')
  gitalias(save='stash save')
  gitalias(last='!git commits --numstat -1')
  gitalias(find='!git ls-files | grep -i')
  gitalias(root='rev-parse --shot-toplevel')
  gitalias(st='status')

def symsetup ():
  if posix: mkdir('~/.config')

  symlink('gvimrc', '.gvimrc')
  symlink('vimrc', '.vimrc')
  symlink('vim', '.vim')
  symlink(shell, shell_target)

#-----------------------------------------------------------------------------
# Entry Point
#-----------------------------------------------------------------------------
if __name__ == '__main__':
  parser = ArgumentParser(formatter_class=ArgumentDefaultsHelpFormatter)
  group = parser.add_mutually_exclusive_group()
  argument = partial(group.add_argument, action='store_true')

  argument('--git', help='gitconfig only')
  argument('--sym', help='symlink only')

  # if no options are specified, all options are run
  args = vars(parser.parse_args())
  if not any(args.values()): args = dict.fromkeys(args, True)

  git = args['git']
  sym = args['sym']

  if git: gitsetup()
  if sym: symsetup()

