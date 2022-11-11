autoload -U promptinit
promptinit

PROMPT="[%n@%m]:%~$ "

if [[ "`uname`" == "Linux" ]]; then
  alias ls='ls --color'
elif [[ "`uname`" == "Darwin" ]]; then
  alias ls='ls -G'
fi

function set-python-alias() {
  alias python=`which python3`
}

function unset-python-alias() {
  unalias python
}

set-python-alias
