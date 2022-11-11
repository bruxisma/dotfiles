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

set backspace=indent,eol,start

au BufNewFile,BufRead *.md set filetype=markdown

nnoremap / /\v
vnoremap / /\v

vnoremap <leader>z :fold

let mapleader = ","

" Let's make the old leader useful ;)
nnoremap \ $

" simplify saving
nnoremap <leader>w :update<CR>

" Open a new vertical split and switch to it.
nnoremap <leader>vs <C-w>v<C-w>l
" Open a new horizontal split and switch to it.
nnoremap <leader>hs <C-w>s<C-w>j

" For navigating split windows easier
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" NERDTree
nnoremap <leader>m :NERDTreeToggle<CR>

" pathogen mappings
nnoremap <leader>help :call pathogen#helptags()<CR>
