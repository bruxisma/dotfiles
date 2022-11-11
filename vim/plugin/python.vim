function! EditPythonSourceFile()
  set softtabstop=2
  set shiftwidth=2
  set tabstop=2
endfunction

au BufRead,BufNewFile *.py call EditPythonSourceFile()
