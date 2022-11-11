" rust.vim doesn't set any defaults for us, so I have to set my own :)
compiler cargo

" visual studio style for gvim. vim ends up as <C-b>
nnoremap <C-S-b> :w<CR>:silent make build<CR>:cw<CR>
inoremap <C-S-b> <Esc>:w<CR>:silent make build<CR>:cw<CR>
vnoremap <C-S-b> <Esc>:w<CR>:silent make build<CR>:cw<CR>
