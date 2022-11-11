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

let mapleader = "," " Using comma for leader is pretty useful, I think

" Allows custom aliases for user commands
function! AliasCommand (abbreviation, expansion, ...)
  execute 'cabbrev ' . a:abbreviation . ' <c-r>=
    \ getcmdpos() == 1 &&  getcmdtype() == ":"
    \ ? "' . a:expansion . '"
    \ : "' . a:abbreviation . '"
    \<CR>'
endfunction
command! -nargs=+ AliasCommand call AliasCommand(<f-args>)
AliasCommand alias AliasCommand

" unite.vim
call unite#filters#matcher_default#use(['matcher_fuzzy'])
Alias ls Unite<Space>buffer " replace ls with Unite buffer

" vimfiler
let g:vimfiler_as_default_explorer = 1
" needs some tweaking to remove the filer if it's currently available.
"nnoremap <leader>m :VimFiler -buffer-name=explorer -split -simple 
"-winwidth=35 -toggle -no-quit<CR>

" neosnippet
let g:neosnippet#snippets_directory='~/.vim/snippets'
imap <expr><TAB> neosnippet#expandable_or_jumpable()
  \ ? "\<Plug>(neosnippet_expand_or_jump)"
  \ : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable()
  \ ? "\<Plug>(neosnippet_expand_or_jump)"
  \ : "\<TAB>"

let c_no_curly_error = 1 " Fixes *some* C++ support (from 7.3)

" Use perl/python style regex for searches
vnoremap / /\v
nnoremap / /\v

" Open a new vertical or horizontal split respectively split and switch to it.
nnoremap <leader>vs <C-w>v<C-w>l
nnoremap <leader>hs <C-w>s<C-w>j

" solarized
let g:solarized_hitrail=1
if has('gui_running')
  set background=light
else
  set background=dark
endif
colorscheme solarized
