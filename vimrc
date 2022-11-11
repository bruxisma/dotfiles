filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

syntax on
set nocompatible
set number
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set hidden
set nomodeline
set autochdir
set ttyfast
set visualbell
set ruler

" colorcolumn is broken in linux right now :/
if has('mac') || has('win32')
    set colorcolumn=110
endif

set backspace=indent,eol,start

au BufRead,BufNewFile *.md set filetype=markdown

nnoremap / /\v
vnoremap / /\v

vnoremap <leader>z :fold

let mapleader = ","

" simplify saving
nnoremap <leader>w :update<CR>

" Open a new vertical split and switch to it.
nnoremap <leader>vs <C-w>v<C-w>l
" Open a new horizontal split and switch to it.
nnoremap <leader>hs <C-w>s<C-w>j

"Clang complete settings
"Runs the completion command
let clang_complete_copen=1
let clang_snippets=1

" First Person Shooter Movement keys
"nnoremap w k
"nnoremap s j
"nnoremap d l
"nnoremap a h

" NERDTree
nnoremap <leader>m :NERDTreeToggle<CR>

" Customg color scheme
colorscheme kadesh

" pathogen mappings
nnoremap <leader>help :call pathogen#helptags()<CR>
