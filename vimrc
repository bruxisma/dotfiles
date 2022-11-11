set nocompatible
filetype off

" Allows custom aliases for user commands, can also 'overwrite' builtins
function! AliasCommand (abbreviation, expansion, ...)
  execute 'cabbrev ' . a:abbreviation . ' <c-r>=
    \ getcmdpos() == 1 &&  getcmdtype() == ":"
    \ ? "' . a:expansion . '"
    \ : "' . a:abbreviation . '"
    \<cr>'
endfunction

" toggle between number and relativenumber
function! ToggleRelativeNumber ()
  if (&relativenumber == 1)
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunction

let s:starting = has('vim_starting')
let s:gui = has('gui_running')
let s:multibyte = has('multibyte')

let s:windows = has('win32') || has('win64')
let s:osx = has('mac')

if s:windows | set rtp^=$HOME/.vim | endif
if s:starting | set rtp+=$HOME/.vim/bundle/neobundle.vim/ | endif

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

NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'
NeoBundle 'sjl/gundo.vim'

" library support bundles
NeoBundle 'beyondmarc/opengl.vim' " OpenGL

" language support bundles
NeoBundle 'octol/vim-cpp-enhanced-highlight' " C++11/14
NeoBundle 'leafgarland/typescript-vim'       " typescript
NeoBundle 'slurps-mad-rips/cmake.vim'        " CMake
NeoBundle 'pangloss/vim-javascript'          " JS
NeoBundle 'kongo2002/fsharp-vim'             " F#
NeoBundle 'tikhomirov/vim-glsl'              " GLSL
NeoBundle 'rust-lang/rust.vim'               " rust
NeoBundle 'PProvost/vim-ps1'                 " Windows Powershell
NeoBundle 'dag/vim-fish'                     " fish shell
NeoBundle 'fatih/vim-go'                     " golang

filetype plugin indent on
syntax on

NeoBundleCheck

" options
if s:multibyte | set fileencodings=ucs-bom,utf-8,latin1 | endif
if s:multibyte | setglobal fileencoding=utf-8 | endif
if s:multibyte | set encoding=utf-8 | endif
if &shell =~# 'fish$' | set shell=sh | endif
set backspace=indent,eol,start
set background=dark
set foldlevelstart=10
set foldnestmax=10
set colorcolumn=80 " draw a line at 80 columns
set softtabstop=2
set shiftwidth=2
set laststatus=2   " always have a statusline
set tabstop=2
set cino=N-s   " c++ specific indent option
set autoindent " Copy line indent (not always correct)
set nomodeline " modelines are really dumb
set visualbell " beeps rarely help
set noswapfile " disable all .swp files
set cursorline " highlight current line
set foldenable " allow folds
set expandtab  " convert tabs to spaces
set autochdir  " set current directory to buffer
set wildmenu   " menu for matching during command autocomplete
set hlsearch   " highlight matches
set ttyfast    " don't think this has ever been an issue
set hidden     " prefer buffers over tabs
set number     " line numbers
set ruler      " line and column
if s:gui | set background=light | endif " solarized

" commands
command! -nargs=+ AliasCommand call AliasCommand(<f-args>)
command! ToggleRelativeNumber call ToggleRelativeNumber()

" Aliases
Alias reload source<space>% " builtin

Alias ls Unite<space>buffer " unite.vim
Alias unite Unite           " unite.vim

Alias checkout Gread " fugitive
Alias status Gstatus " fugitive
Alias commit Gcommit " fugitive
Alias blame Gblame   " fugitive
Alias diff Gvdiff    " fugitive
Alias pull Gpull     " fugitive
Alias push Gpush     " fugitive
Alias gitk Gitv      " fugitive
Alias add Gwrite     " fugitive
Alias log Glog       " fugitive
Alias git Git        " fugitive

Alias gundo GundoToggle " gundo

" Variables

if s:multibyte && &termencoding == "" | let &termencoding = &encoding | endif
let c_no_curly_error = 1 " Fixes C++11 highlighting issues
let mapleader = "," " Almost everyone does this

" global plugin options
let g:neosnippet#snippets_directory=expand('~/.vim/snippets') " neosnippet
let g:vimfiler_as_default_explorer = 1                        " vimfiler
let g:cpp_class_scope_highlight = 1                           " cxx
let g:rust_recommended_style = 0                              " rust
let g:opencl_overwrite_lisp = 1                               " opencl
let g:solarized_hitrail=s:gui                                 " solarized
let g:gundo_right = 1                                         " gundo

" lightline.vim
let g:lightline = {
  \ 'colorscheme': 'solarized_' . &background,
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

" call last set of functions here
call unite#filters#matcher_default#use(['matcher_fuzzy']) " unite.vim

" Bindings
imap <expr><tab> neosnippet#expandable_or_jumpable()
  \ ? "\<plug>(neosnippet_expand_or_jump)"
  \ : pumvisible() ? "\<c-n>" : "\<tab>"
smap <expr><tab> neosnippet#expandable_or_jumpable()
  \ ? "\<plug>(neosnippet_expand_or_jump)"
  \ : "\<tab>"

" Use perl/python style regex for searches
vnoremap / /\v
nnoremap / /\v

" Open a new vertical or horizontal split
nnoremap <leader>v :vsplit<cr>
nnoremap <leader>h :split<cr>

" Open a new vertical or horizontal split and switch to it.
nnoremap <leader>vs <c-w>v<c-w>l
nnoremap <leader>hs <c-w>s<c-w>j

" turn off search highlight
nnoremap <leader><space> :nohlsearch<cr>

" open and close folds
nnoremap <space> za

" toggle gundo
nnoremap <leader>u :GundoToggle<cr>

" match chevrons in C++ files
autocmd FileType cpp set mps+=<:>
colorscheme solarized
