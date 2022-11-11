set nocompatible
filetype off

if has('win32') || has('win64')
  set rtp^=$HOME/.vim
endif

if has('vim_starting')
  set rtp+=$HOME/.vim/bundle/neobundle.vim/
endif
let g:neobundle#types#git#default_protocol = 'git'
call neobundle#rc(expand('~/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc.vim', {
  \ 'build' : {
  \ 'windows' : 'mingw32-make -f make_msvc32.mak',
  \ 'mac' : 'make -f make_mac.mak',
  \ 'unix' : 'make -f make_unix.mak'
  \ }
\ }

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/neosnippet.vim'
"NeoBundle 'Shougo/neocomplete.vim'

"NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-fugitive'

NeoBundle 'altercation/vim-colors-solarized'
"NeoBundle 'scrooloose/syntastic'
NeoBundle 'gregsexton/gitv'

" library support bundles
NeoBundle 'beyondmarc/opengl.vim' " OpenGL

" language support bundles
NeoBundle 'sahchandler/cxx-syntax.vim'  " C11 and C++11+
NeoBundle 'kongo2002/fsharp-vim'        " F#
NeoBundle 'PProvost/vim-ps1'            " Windows Powershell
NeoBundle 'beyondmarc/glsl.vim'         " GLSL

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

set cino=N-s " c++ specific indent option

" vimfiler
let g:vimfiler_as_default_explorer = 1

" neosnippet
imap <expr><TAB> neosnippet#expandable_or_jumpable()
  \ ? "\<Plug>(neosnippet_expand_or_jump)"
  \ : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable()
  \ ? "\<Plug>(neosnippet_expand_or_jump)"
  \ : "\<TAB>"

let g:neosnippet#snippets_directory='~/.vim/snippets'

let c_no_curly_error = 1 " Fixes *some* C++ support (from 7.3)

let mapleader = "," " Using comma for leader is pretty useful, I think

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
