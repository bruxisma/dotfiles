" Vim plugin that set configuration to a specified subset when working in C
" (This is specifically done for a project I am working on, and may be disable
" later)

function! EditCSourceFile()
    " I only ever use these in C and C++
  set syntax=c.doxygen
  if has('mac') || has('win32')
    set colorcolumn=80
  endif
endfunction

function! EditCPPSourceFile()
    " I only ever use these in C and C++
  set syntax=cpp.doxygen
  if has('mac') || has('win32')
    set colorcolumn=80
  endif
endfunction

au BufRead,BufNewFile *.cpp call EditCPPSourceFile()
au BufRead,BufNewFile *.hpp call EditCPPSourceFile()
au BufRead,BufNewFile *.c call EditCSourceFile()
au BufRead,BufNewFile *.h call EditCSourceFile()
