" Vim plugin that lets me treat powershell modules as powershell scripts

function! EditPSHScriptFile()
  set syntax=powershell
  set filetype=ps1
endfunction

au BufRead,BufNewFile *.psm1 call EditPSHScriptFile()
au BufRead,BufNewFile *.ps1 call EditPSHScriptFile()
