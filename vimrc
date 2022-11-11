call pathogen#infect()
filetype plugin indent on
syntax on

set nocompatible
set number
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set hidden
set nomodeline
set autochdir
set ttyfast
set visualbell
set ruler
set backspace=indent,eol,start

if !has('mac')
  set t_Co=256
endif

vnoremap <leader>z zf
vnoremap / /\v

" NERDTree
nnoremap <leader>m :NERDTreeToggle<CR>
" pathogen mappings
nnoremap <leader>help :call pathogen#helptags()<CR>
" simplify saving
nnoremap <leader>w :update<CR>
nnoremap <leader>z za
nnoremap / /\v

" Open a new vertical or horizontal split respectively split and switch to it.
nnoremap <leader>vs <C-w>v<C-w>l
nnoremap <leader>hs <C-w>s<C-w>j

" Fixes *some* C++ support :)
let c_no_curly_error = 1
let mapleader = ","
if !has('mac') || !has('win32')
  let g:hybrid_use_Xresources=1
endif

colorscheme hybrid
