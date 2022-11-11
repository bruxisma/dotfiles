# We don't want to use this for a non-interactive shell

[[ -z "$PS1" ]] && return

autoload -U promptinit
promptinit

export PROMPT="[%n@%m]:%~$ "
export EDITOR="vim"

# Useful functions
find-text() {
  grep -inHR "$1" ./
}

# alias section -- Contains *some* platform specific code
if [[ "`uname`" == "Linux" ]]; then
  alias ls="ls --color"
else
  alias ls="ls -G"
fi

# Platform specific code
if [[ "`uname`" == "Darwin" ]]; then
  export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
fi
