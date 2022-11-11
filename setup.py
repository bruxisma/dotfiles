#!/usr/bin/env python
# Installs the files and folders to $HOME via symlinks
# Assumes it is run as python setup.py
# Requires Python 3 for Windows use

# Errors out if it can't clean up symlinks, or directories.
# Needs to be run as administrator to create symlinks on Windows.
# When run from PowerShell, use 'su' which works as one might expect it to.

from __future__ import print_function

from functools import partial

from sys import platform
from sys import exit

from subprocess import CalledProcessError
from subprocess import check_call as call
from os.path import expanduser as expand
from os.path import islink
from os.path import isdir
from os.path import join
from os import symlink
from os import getcwd
from os import remove

windows = platform == 'win32'

def gitconfig (section, variable, value):
  '''Given a *section*, *variable*, and *value*, adds the *variable* to the
  global .gitconfig with *value*. This is done instead of adding a .gitconfig
  file to the repo because some settings need to change on a per machine basis

  Exits with an error message if any call fails
  '''
  cmd = ['git', 'config', '--global', '{}.{}'.format(section, variable), value]
  try: call(cmd)
  except CalledProcessError as e: exit(str(e))

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
  linker = partial(symlink, item, link)
  if windows:
    linker = partial(linker, target_is_directory=isdir(item))
  try: linker()
  except OSError as e: exit('Could not symlink {}: {}'.format(item, e))

if __name__ == '__main__':
  front = '_' if windows else '.'
  head = 'Documents' if windows else '.config'
  tail = 'WindowsPowershell' if windows else 'fish'
  shell_target = join(head, tail)
  shell = 'psh' if windows else 'fish'

  unshelve = 'stash pop'
  unstage = 'reset HEAD'
  changes = 'status -s'
  history = 'log --graph --decorate --pretty=oneline --abbrev-commit --all'
  shelve = 'stash save --include-untracked'
  ignore = '!f(){ echo $1 >> .gitignore; }; f'
  fixup = 'commit -m fixup'
  save = 'stash save'
  last = 'log --graph --decorate --pretty=oneline --abbrev-commit --numstat -1'
  this = '!git init && git add . && git commit -m "Initial Commit"'
  find = '!git ls-files | grep -i'
  root = 'rev-parse --show-toplevel'
  undo = 'reset --soft @~1'
  mar = 'checkout --'
  st = 'status'

  gitconfig('user', 'name', 'Isabella Muerte')

  gitconfig('push', 'default', 'simple')

  gitconfig('core', 'autocrlf', 'input')
  gitconfig('core', 'editor', 'gvim -f')

  gitconfig('log', 'date', 'iso')

  gitconfig('alias', 'unshelve', unshelve)
  gitconfig('alias', 'unstage', unstage)
  gitconfig('alias', 'changes', changes)
  gitconfig('alias', 'history', history)
  gitconfig('alias', 'shelve', shelve)
  gitconfig('alias', 'ignore', ignore)
  gitconfig('alias', 'fixup', fixup)
  gitconfig('alias', 'save', save)
  gitconfig('alias', 'last', last)
  gitconfig('alias', 'this', this)
  gitconfig('alias', 'find', find)
  gitconfig('alias', 'root', root)
  gitconfig('alias', 'undo', undo)
  gitconfig('alias', 'mar', mar)
  gitconfig('alias', 'st', st)

  symlink('gvimrc', '{}gvimrc'.format(front))
  symlink('vimrc', '{}vimrc'.format(front))
  symlink('vim', '{}vim'.format(front))
  symlink(shell, shell_target)
