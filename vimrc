source $VIMRUNTIME/defaults.vim

set runtimepath-=$HOME/vimfiles/after
set runtimepath-=$HOME/vimfiles
set runtimepath+=$HOME/.vim/after
set runtimepath^=$HOME/.vim

set packpath-=$HOME/vimfiles/after
set packpath-=$HOME/vimfiles
set packpath+=$HOME/.vim/after
set packpath^=$HOME/.vim

set termencoding=utf-8
set encoding=utf-8
scriptencoding utf-8

set fileformats=unix,dos
set shortmess+=aoOTIF
set laststatus=2

set nomodeline
set noswapfile
set visualbell
set number

if executable('pwsh')
  set shell=pwsh
  set shellcmdflag=-NoLogo\ -NoProfile\ -ExecutionPolicy\ RemoteSigned
  set shellcmdflag+=\ -Command\ [Console]::InputEncoding=[System.Text.Encoding]::UTF8;
endif

if executable('rg') 
  set grepformat^=%f:%l%c:%m
  set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case\ --unrestricted\ --unrestricted
endif

if !$WT_SESSION->empty() | set t_Co=256 | endif

set listchars=tab:»\ ,extends:▶,precedes:◀,nbsp:␣,trail:·
set list

set wildmenu

set foldlevelstart=10 foldnestmax=10 foldenable
set showmatch matchtime=1

set cursorline colorcolumn=80
set softtabstop=-1 tabstop=2 shiftwidth=2

set virtualedit=block
set nrformats=hex
if has('+diff') | set diffopt+=vertical | endif

set ignorecase smartcase
set incsearch hlsearch
set expandtab smarttab

set autoindent
set autochdir
set hidden

set background=light
if has('gui')
  set guioptions=afgm
  set guifont=
  set columns=120
  set lines=40
  if has('mac') | set macligatures | endif
  if has('win32')
    silent! set guifont=Cascadia_Code_NF:h12:cANSI:qDRAFT
    silent! set guioptions+=!
    silent! set renderoptions=type:directx
    silent! set renderoptions+=gamma:1.0 ",contrast:0.5,level:0.5,
    silent! set renderoptions+=geom:1,renmode:5,taamode:2
  endif
endif

let mapleader = "," " Almost everyone used to do this...

function! s:command(name, ...)
  return getcmdtype() == ':' && getcmdline() =~# '^' .. a:name
        \ ? join(a:000, ' ')
        \ : a:name
endfunction 

cnoreabbrev <expr> rc <SID>command("rc", "edit<Space>$MYVIMRC")

cnoreabbrev <expr> reload <SID>command("reload", "source<Space>$MYVIMRC")

cnoreabbrev <expr> lgrep <SID>command("lgrep", "silent<Space>lgrep")
cnoreabbrev <expr> grep <SID>command("grep", "silent<Space>grep")

inoremap <C-Space> <C-X><C-O>

inoremap <C-C> <Esc>
vnoremap <C-C> <Esc>

" Use perl/python style regex for searches
vnoremap / /\v
nnoremap / /\v

nnoremap gw :silent<Space>grep<Space><cWORD><cr>

" Navigate buffers
nnoremap [b :bprev<CR>
nnoremap ]b :bnext<CR>

" Navigate loclist file
nnoremap [l :lprevious<CR>
nnoremap ]l :lnext<CR>

" Navigate quickfix
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>

" Open a new vertical or horizontal split
nnoremap <Leader>v :vsplit<CR>
nnoremap <Leader>h :split<CR>

" Open a new vertical or horizontal split and switch to it.
nnoremap <Leader>vs <C-W>v<C-W>l
nnoremap <Leader>hs <C-W>s<C-W>j

" clear hlsearch
nnoremap <Leader><Space> :silent! call setreg('/', '')<CR>

" This is useful for those languages where I do things
nnoremap <F5> :silent make<CR>
nnoremap <F4> :cclose<CR>

" Open quickfix window automatically
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

autocmd BufNewFile,BufRead *.{cpp,cc,cxx} setlocal cinoptions=N-s,L0,l1,g0,E-s,j1
autocmd BufNewFile,BufRead *.{cpp,cc,cxx,cmake} setlocal matchpairs+=<:>
autocmd BufNewFile,BufRead CMakeLists.txt setlocal matchpairs+=<:>

" global plugin options
let g:cpp_class_scope_highlight = 1
let g:cpp_concepts_highlight = 1
let g:load_doxygen_syntax = 1

" sh.vim
let g:is_kornshell = 0
let g:is_posix = 1
let g:sh_fold_enabled = 3 " heredoc + function folding

let g:netrw_liststyle = 3
let g:netrw_winsize = 30
let g:netrw_banner = 0
let g:netrw_menu = 0

colorscheme zaibatsu
