if [[ "`uname`" == "Darwin" ]]; then
  path=("/Library/Frameworks/Python.framework/Versions/3.2/bin" "$path[@]")
  export PATH
  typeset -U path
fi
