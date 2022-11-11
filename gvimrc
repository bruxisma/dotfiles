" increase the size of course
set lines=54 columns=210

set colorcolumn=80 " this works in vim-qt :)
set guioptions-=T
set guioptions=aegm

if has('mac')
  set gfn=Source\ Code\ Pro:h12
elseif has('win32') || has('win64')
  set guifont=Consolas:h12:b:cANSI
else
  set gfn=Source\ Code\ Pro\ 10
endif

" insert mode
inoremap <C-s> <ESC>
nnoremap <C-s> i
