function fish_prompt --description 'Write out the prompt'
  set -l home_escaped (echo -n $HOME | sed 's/\//\\\\\//g')
  set -l pwd (echo -n $PWD | sed "s/^$home_escaped/~/" | sed 's/ /%20/g')
  set -l prompt_symbol ''
  switch $USER
    case root; set prompt_symbol '#'
    case '*'; set prompt_symbol '$'
  end
  printf '[%s@%s]: %s%s%s%s ' $USER (hostname -s) (set_color $fish_color_cwd) \
    $pwd (set_color $fish_color_normal) $prompt_symbol
end
