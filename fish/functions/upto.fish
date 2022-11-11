function upto --description 'Change directory to given name in current path'
  if test 1 -ne (count $argv)
    return (error 'upto only takes on argument')
  end
  set -l current (dirname (pwd))
  set -l target $argv[1]
  if test $target = /
    return (cd /)
  end
  while test -n $current
    # No idea why I need to use an echo on a variable, when it should be empty
    # on return, but oh well
    set -l found (basename $current | grep -i $target)
    if test -n (echo $found)
      return (cd $current)
    end
    set current (dirname $current)
    if test $current = /
      return (error "couldn't find '$target' in current directory hierarchy")
    end
  end
end
