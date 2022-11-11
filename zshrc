# We don't want to use this for a non-interactive shell

[[ -z "$PS1" ]] && return

autoload -U promptinit
promptinit

PROMPT="[%n@%m]:%~$ "
EDITOR="vim"
SYSTEM_PATH="${PATH}" # We 'backup' the PATH before we mess with it.

# Useful functions
find-text() {
  grep -inHR "$1" ./
}

# Used primarily for Mac OS X to switch between System python (2.7) and
# Python 3.2 (NOTE: does not change the python executable for a given run.
set-python() {
  # Update this for each 'current version' as seen fit
  local python_path="/Library/Frameworks/Python.framework/Versions/3.2/bin"
  local python_exe="`which python`"
  if [[ "${SYSTEM_PATH}" == "${PATH}" ]]; then
    PATH="${python_path}:${SYSTEM_PATH}"
  else
    PATH="${SYSTEM_PATH}"
  fi
}

# alias section -- Contains platform specific code
if [[ "`uname`" == "Linux" ]]; then
  alias ls='ls --color'
elif [[ "`uname`" == "Darwin" ]]; then
  alias ls='ls -G'
fi
