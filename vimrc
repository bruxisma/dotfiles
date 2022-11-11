set nocompatible

" Functions {{{
" LightlineReadonly {{{
function! LightlineReadonly()
  return &readonly ? "\ue0a2" : ''
endfunction

" }}}
" LightlineFugitive {{{
function! LightlineFugitive()
  if exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? "\ue0a0 " . branch : '' 
  endif
  return ''
endfunction

" }}}
" AliasCommand {{{
function! AliasCommand (abbreviation, expansion, ...)
  " Allows custom aliases for user commands, can also 'overwrite' builtins
  execute 'cabbrev ' . a:abbreviation . ' <c-r>=
    \ getcmdpos() == 1 &&  getcmdtype() == ":"
    \ ? "' . a:expansion . '"
    \ : "' . a:abbreviation . '"
    \<cr>'
endfunction
" }}}
" ToggleRelativeNumber {{{
function! ToggleRelativeNumber ()
  " toggle between number and relativenumber
  if (&relativenumber == 1)
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunction
" }}}
" }}}

" XDG Support {{{
set directory=$XDG_CACHE_HOME/vim,$TEMP,~/
set backupdir=$XDG_CACHE_HOME/vim,$TEMP,~/
set viminfo+=n$TEMP/viminfo
"set runtimepath=$XDG_CONFIG_HOME/vim,$XDG_CONFIG_HOME/vim/after,$VIM,$VIMRUNTIME
"let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc"
" }}}

" Feature Checks {{{
let s:multibyte = has('multi_byte')
let s:gui = has('gui_running')

let s:windows = has('win32') || has('win64')
let s:osx = has('mac')

if s:windows | set rtp^=$HOME/.vim | set rtp+=$HOME/.vim/after | endif
"}}}

" Plugins {{{
call plug#begin('~/.vim/bundle')

Plug 'Shougo/unite.vim'
Plug 'Shougo/neosnippet.vim'

Plug 'altercation/vim-colors-solarized'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'gregsexton/gitv'
Plug 'dracula/vim'
Plug 'sjl/gundo.vim'

" language support bundles
Plug 'jparise/vim-graphql'              " GraphQL
Plug 'octol/vim-cpp-enhanced-highlight' " C++
Plug 'pboettch/vim-cmake-syntax'        " CMake
Plug 'HerringtonDarkholme/yats.vim'     " TypeScript
Plug 'othree/yajs.vim'                  " JavaScript
Plug 'rust-lang/rust.vim'               " Rust
Plug 'PProvost/vim-ps1'                 " Windows Powershell
Plug 'dag/vim-fish'                     " Fish Shell
Plug 'sophacles/vim-bundle-mako'        " Mako Templates
Plug 'stephpy/vim-yaml'                 " YAML (fix)
Plug 'cespare/vim-toml'                 " Toml

call plug#end()
" }}}

" Vim Options {{{
if executable('rg') | set grepprg=rg\ --vimgrep | endif
if s:multibyte | set fileencodings=ucs-bom,utf-8,latin1 | endif
if s:multibyte | setglobal fileencoding=utf-8 | endif
if s:multibyte | set encoding=utf-8 | endif
if &shell =~# 'fish$' | set shell=sh | endif

set fileformats=unix,dos
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
" }}}

" Commands {{{
command! -nargs=+ AliasCommand call AliasCommand(<f-args>)
command! ToggleRelativeNumber call ToggleRelativeNumber()
" }}}

" Aliases {{{
Alias reload source<space>$MYVIMRC " builtin

Alias files Unite<space>file " unite.vim
Alias ls Unite<space>buffer  " unite.vim
Alias unite Unite            " unite.vim

Alias unlink Unlink " eunuch
Alias chmod Chmod   " eunuch
Alias rm Delete     " eunuch
Alias mv Move       " eunuch

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

Alias relative RelativeNumberToggle
Alias gutter GitGutterLineHighlightsToggle

" }}}

" Plugin Variables {{{

if s:multibyte && &termencoding == "" | let &termencoding = &encoding | endif
let c_no_curly_error = 1 " Fixes C++ highlighting issues
let mapleader = "," " Almost everyone does this

" global plugin options
let g:neosnippet#snippets_directory=expand('~/.vim/snippets') " neosnippet
let g:neosnippet#disable_runtime_snippets = { '_' : 1 }       " neosnippet
let g:vimfiler_force_overwrite_statusline = 0                 " vimfiler
let g:vimfiler_as_default_explorer = 1                        " vimfiler
let g:unite_force_overwrite_statusline = 0                    " unite
let g:cpp_class_scope_highlight = 1                           " cxx
let g:rust_recommended_style = 0                              " rust
let g:opencl_overwrite_lisp = 1                               " opencl
let g:solarized_hitrail=s:gui                                 " solarized
let g:gundo_right = 1                                         " gundo
let g:gundo_prefer_python3 = 1                                " gundo
let g:gitgutter_avoid_cmd_prompt_on_windows = 0               " gitgutter

" I hate doxygen with a passion, but I can't get document comments with ///
" otherwise >:(
let g:load_doxygen_syntax=1

" lightline.vim
let g:lightline = {
  \ 'colorscheme': 'Dracula',
  \ 'active' : {
  \   'left': [
  \     ['mode', 'paste'],
  \     ['fugitive', 'readonly', 'filename', 'modified']
  \   ]
  \ },
  \ 'component' : { 'lineinfo': "\ue0a1 %3l:%-2v" },
  \ 'component_function' : {
  \ 'readonly' : 'LightlineReadonly',
  \   'fugitive' : 'LightlineFugitive'
  \ },
  \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
	\ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
  \ }

" call last set of functions here
call unite#filters#matcher_default#use(['matcher_fuzzy']) " unite.vim

" }}}

" Bindings {{{
imap <expr><tab> neosnippet#expandable_or_jumpable()
  \ ? "\<plug>(neosnippet_expand_or_jump)"
  \ : pumvisible() ? "\<c-n>" : "\<tab>"
smap <expr><tab> neosnippet#expandable_or_jumpable()
  \ ? "\<plug>(neosnippet_expand_or_jump)"
  \ : "\<tab>"

inoremap <C-c> <Esc>
vnoremap <C-c> <Esc>

" Use perl/python style regex for searches
vnoremap / /\v
nnoremap / /\v

" Change window to directory of local file (fixes occasional glitch with Unite)
nnoremap <leader>lcd :lcd %:p:h<cr>:pwd<cr>

" Open a new vertical or horizontal split
nnoremap <leader>v :vsplit<cr>
nnoremap <leader>h :split<cr>

" Open a new vertical or horizontal split and switch to it.
nnoremap <leader>vs <C-w>v<C-w>l
nnoremap <leader>hs <C-w>s<C-w>j

" turn off search highlight
nnoremap <leader><space> :nohlsearch<cr>

" toggle gundo
nnoremap <leader>u :GundoToggle<cr>

" This is useful for those languages where I do things
nnoremap <F5> :silent make<cr>
nnoremap <F4> :cclose<cr>

" }}}

" match chevrons in C++ files
autocmd FileType cpp set mps+=<:>

" quickfix window on :make
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

colorscheme dracula
