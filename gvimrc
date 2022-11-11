" We should only have NERDTree open for GUI.
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" insert mode
inoremap <C-s> <ESC>
nnoremap <C-s> i

" increase the size of course
set lines=54 columns=210

set colorcolumn=80
set guioptions-=T
set guioptions=aegm

if has('mac')
  set gfn=Source\ Code\ Pro:h12
elseif has('win32')
  set gfn=Source_Code_Pro:h10
else
  set gfn=Source\ Code\ Pro\ 10
endif
