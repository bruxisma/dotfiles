# We don't want to use this for a non-interactive shell

[[ -z "$PS1" ]] && return

autoload -U promptinit
promptinit

PROMPT="[%n@%m]:%~$ "
EDITOR="vim"

set-ls-alias() {
  if [[ "`uname`" == "Linux" ]]; then
    alias ls='ls --color'
  elif [[ "`uname`" == "Darwin" ]]; then
    alias ls='ls -G'
  fi
}

unset-ls-alias() {
  unalias ls
}

# set/unset python aliases lets me work in python3 without worrying about
# screwing up my system path or anything like that.
set-python-alias() {
  local python_path="/Library/Frameworks/Python.framework/Versions/3.2/bin"

  alias sphinx-build="${python_path}/sphinx-build"
  alias nosetests="${python_path}/nosetests"
  alias python="${python_path}/python3"
  alias tox="${python_path}/tox"
  alias pip="${python_path}/pip"
}

unset-python-alias() {
  unalias sphinx-build
  unalias nosetests
  unalias python
  unalias tox
  unalias pip
}

set-python-alias
set-ls-alias

