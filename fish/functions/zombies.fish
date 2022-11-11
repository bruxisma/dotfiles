function zombies --description 'Print all zombie and their parent PIDs'
  ps axo pid=,stat=,ppid= | awk '$2~/^Z/ { printf "%s %s\n",$1,$3 }'
end
