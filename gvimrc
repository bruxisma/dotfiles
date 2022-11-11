" We should only have NERDTree open for GUI.
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" insert mode
inoremap <C-s> <ESC>
nnoremap <C-s> i

" increase the size of course
set lines=54 columns=210

" Auto plugins
call flux#set('kadesh', 'vaygr')

set gfn=Consolas:h12

set guioptions-=T
set guioptions=aegm

if has('mac')
  set gfn=DejaVu\ Sans\ Mono:h12
elseif has('win32')
  set gfn=DejaVu\ Sans\ Mono:h10
else
  set gfn=DejaVu\ Sans\ Mono\ 10
endif
