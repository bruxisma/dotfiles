function error --description 'Prints an error mesage and then returns'
  echo $argv >&2
  return 1
end
