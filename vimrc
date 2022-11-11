filetype off
call pathogen#runtime_append_all_bundles()
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

" colorcolumn is broken in linux right now :/
if has('mac') || has('win32')
    set colorcolumn=80
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
"However windows does not work properly with clang right now
if has('win32')
    let clang_complete_auto=0
    let clang_hl_errors=0
else
    let clang_complete_copen=1
    let clang_snippets=1
endif

" Conque settings
" Allows me to run a shell, without leaving insert mode within the given
" buffer
let ConqueTerm_CWInsert=1
let ConqueTerm_InsertOnEnter=1
let ConqueTerm_CloseOnEnd=1
if has('win32')
  nnoremap <leader>c :ConqueTermSplit Powershell.exe<CR>
else
  nnoremap <leader>c :ConqueTermSplit zsh<CR>
endif

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
