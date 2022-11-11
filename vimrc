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

if !has('mac')
  set t_Co=256
endif
" Code folding!
vnoremap <leader>z zf
nnoremap <leader>z za

" colorcolumn is broken in linux right now :/
if has('mac') || has('win32')
  set colorcolumn=80
endif

set backspace=indent,eol,start

au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.ps1 set filetype=ps1

nnoremap / /\v
vnoremap / /\v


let mapleader = ","

" simplify saving
nnoremap <leader>w :update<CR>

" Open a new vertical split and switch to it.
nnoremap <leader>vs <C-w>v<C-w>l
" Open a new horizontal split and switch to it.
nnoremap <leader>hs <C-w>s<C-w>j

" Conque settings
" Allows me to run a shell, without leaving insert mode within the given
" buffer
let ConqueTerm_CWInsert=1
let ConqueTerm_InsertOnEnter=1
let ConqueTerm_CloseOnEnd=1
let ConqueTerm_EscKey='<C-s>'
if has('win32')
  nnoremap <leader>c :ConqueTermSplit Powershell.exe<CR>
else
  nnoremap <leader>c :ConqueTermSplit zsh<CR>
endif

" NERDTree
nnoremap <leader>m :NERDTreeToggle<CR>

" Custom color scheme
colorscheme xoria256

" pathogen mappings
nnoremap <leader>help :call pathogen#helptags()<CR>
