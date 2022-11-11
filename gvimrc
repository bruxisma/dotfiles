" We should only have NERDTree open for GUI.
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
autocmd GUIEnter * simalt ~x

" insert mode
inoremap <C-s> <ESC>
nnoremap <C-s> i
