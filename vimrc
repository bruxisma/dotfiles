set nocompatible
filetype off

if has('win32') || has('win64')
  set rtp^=$HOME/.vim
endif

" This should be the default, but NOOOO.
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  set fileencodings=ucs-bom,utf-8,latin1
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

NeoBundle 'tpope/vim-fugitive'

NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'gregsexton/gitv'

" library support bundles
NeoBundle 'beyondmarc/opengl.vim' " OpenGL

" language support bundles
NeoBundle 'slurps-mad-rips/cxx-syntax.vim'  " C11 and C++11+
NeoBundle 'slurps-mad-rips/cmake.vim'       " CMake
NeoBundle 'kongo2002/fsharp-vim'            " F#
NeoBundle 'PProvost/vim-ps1'                " Windows Powershell
NeoBundle 'tikhomirov/vim-glsl'             " GLSL
NeoBundle 'fatih/vim-go'                    " golang
NeoBundle 'leafgarland/typescript-vim'      " typescript
NeoBundle 'rust-lang/rust.vim'              " rust
NeoBundle 'pangloss/vim-javascript'         " JS

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
set hlsearch
set noswapfile " disable all .swp files
set colorcolumn=80

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

" solarized
if has('gui_running')
  let g:solarized_hitrail=1
  set background=light
else
  set background=dark
endif
colorscheme solarized

" unite.vim
call unite#filters#matcher_default#use(['matcher_fuzzy'])
Alias ls Unite<Space>buffer " replace ls with Unite buffer

" lightline.vim
let g:lightline = {
  \ 'colorscheme': 'solarized_light',
  \ 'active' : {
  \   'left': [
  \     ['mode', 'paste'],
  \     ['fugitive', 'readonly', 'filename', 'modified']
  \   ]
  \ },
  \ 'component' : {
  \   'fugitive' : '%{exists("*fugitive#head")?fugitive#head():""}'
  \ },
  \ 'component_visible_condition' : {
  \   'fugitive' : '(exists("*fugitive#head()") && ""!=fugitive#head())'
  \ }
  \ }
set laststatus=2

" rust
let g:rust_recommended_style = 0

" vimfiler
let g:vimfiler_as_default_explorer = 1

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

" match chevrons in C++ files
autocmd FileType cpp set mps+=<:>
