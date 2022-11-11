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

nnoremap / /\v
vnoremap / /\v

" Auto plugins
autocmd VimEnter * MiniBufExplorer
autocmd VimEnter * wincmd p
call flux#set('kadesh', 'vaygr')

" consider setting to capslock?
let mapleader = ","

" insert mode
inoremap <C-s> <ESC>
nnoremap <C-s> i
" j and k will act like they should now
nnoremap j gj
nnoremap k gk

" simplify saving
nnoremap <leader>w :update<CR>

" Open a new vertical split and switch to it.
nnoremap <leader>vs <C-w>v<C-w>l

" For navigating split windows easier
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" NERDTree
nnoremap <leader>m :NERDTreeToggle<CR>

" flux mapping
nnoremap <leader>flux :call flux#update()<CR>
nnoremap <leader>swi  :call flux#switch()<CR>

" pathogen mappings
nnoremap <leader>help :call pathogen#helptags()<CR>

" Mini Buffer Explorer
map <leader>b :MiniBufExplorer<CR>
map <leader>t :TMiniBufExplorer<CR>
map <leader>u :UMiniBufExplorer<CR>
