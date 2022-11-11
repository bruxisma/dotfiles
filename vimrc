set nocompatible
filetype off

if has('win32') || has('win64')
  set rtp^=$HOME/.vim
endif

if has('vim_starting')
  set rtp+=$HOME/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
"NeoBundle 'Shougo/neocomplcache.vim'

"NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-fugitive'

NeoBundle 'altercation/vim-colors-solarized'
"NeoBundle 'zhaocai/GoldenView.Vim'
"NeoBundle 'SirVer/ultisnips'
"NeoBundle 'octol/vim-cpp-enhanced-highlight'
"NeoBundle 'scrooloose/syntastic'
"NeoBundle 'gregsexton/gitv'
"NeoBundle 'bling/vim-airline'

filetype plugin indent on
syntax on

NeoBundleCheck

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

" vimfiler
let g:vimfiler_as_default_explorer = 1

" ultisnips
let g:UltiSnipsUsePythonVersion = 3

let c_no_curly_error = 1 " Fixes *some* C++ support (from 7.3)

let mapleader = "," " Using comma for leader is pretty useful, I think
if !has('mac') || !has('win32')
  let g:hybrid_use_Xresources=1
endif

vnoremap <leader>z zf

" Use perl/python style regex for searches
vnoremap / /\v
nnoremap / /\v

" Open a new vertical or horizontal split respectively split and switch to it.
nnoremap <leader>vs <C-w>v<C-w>l
nnoremap <leader>hs <C-w>s<C-w>j

" solarized
if has('gui_running')
  set background=light
else
  set background=dark
endif
colorscheme solarized
