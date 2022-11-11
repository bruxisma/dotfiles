" This vim plugin helps me ensure that for Python, I keep to PEP8 standards.
" While not interfering with my personal standards for other languages :)
function! EditPythonSourceFile()
  set softtabstop=4
  set shiftwidth=4
  set tabstop=4
endfunction

au BufRead,BufNewFile *.py call EditPythonSourceFile()
