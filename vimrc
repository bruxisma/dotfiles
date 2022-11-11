source $VIMRUNTIME/defaults.vim

let s:windows = has('win32') || has('win64')
let s:osx = has('mac')

" Adjust runtimepath to match POSIX more closely
if s:windows
  set runtimepath-=$HOME/vimfiles/after
  set runtimepath-=$HOME/vimfiles
  set packpath-=$HOME/vimfiles/after
  set packpath-=$HOME/vimfiles
  set runtimepath^=$HOME/.vim
  set runtimepath+=$HOME/.vim/after
  set packpath^=$HOME/.vim
  set packpath+=$HOME/.vim/after
  set fileformats=unix,dos
  let $XDG_CONFIG_HOME = get(environ(), 'XDG_CONFIG_HOME', $APPDATA)
  let $XDG_CACHE_HOME = get(environ(), 'XDG_CACHE_HOME', $LOCALAPPDATA)
  let $XDG_DATA_HOME = get(environ(), 'XDG_DATA_HOME', $LOCALAPPDATA)
elseif s:osx
  let $XDG_CONFIG_HOME = get(environ(), 'XDG_CONFIG_HOME', $HOME .. "/Library/Application Support")
  let $XDG_CACHE_HOME = get(environ(), 'XDG_CACHE_HOME', $HOME .. "/Library/Caches")
  let $XDG_DATA_HOME = get(environ(), 'XDG_DATA_HOME', $HOME .. "/Library")
else
  let $XDG_CONFIG_HOME = get(environ(), 'XDG_CONFIG_HOME', $HOME .. "/.config")
  let $XDG_CACHE_HOME = get(environ(), 'XDG_CACHE_HOME', $HOME .. "/.cache")
  let $XDG_DATA_HOME = get(environ(), 'XDG_DATA_HOME', $HOME .. "/.local/share")
endif

set directory=$XDG_CACHE_HOME/vim/swapfile
set backupdir=$XDG_CACHE_HOME/vim/backup
set viminfo+=n$XDG_CACHE_HOME/vim/viminfo
set viewdir=$XDG_CACHE_HOME/vim/view

if empty(glob('$HOME/.vim/autoload/plug.vim'))
  silent !curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs
        \ https://github.com/junegunn/vim-plug/raw/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins {{{ 
call plug#begin('$HOME/.vim/bundle')

Plug 'Shougo/neosnippet.vim'

Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
Plug 'tpope/vim-eunuch'
Plug 'simnalamburt/vim-mundo', { 'on': 'MundoToggle' }
Plug 'junegunn/fzf', { 'do': 'go build -o bin/' } | Plug 'junegunn/fzf.vim'

Plug 'jparise/vim-graphql', { 'for': 'graphql' }
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }
Plug 'HerringtonDarkholme/yats.vim', { 'for': 'typescript' }
Plug 'othree/yajs.vim', { 'for': 'js' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'zigford/vim-powershell', { 'for': 'powershell' }
Plug 'lepture/vim-jinja', { 'for': 'jinja' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
"Plug 'pboettch/vim-cmake-syntax', { 'for': 'cmake' }
Plug '~/Desktop/vim-cmake', { 'for': 'cmake' }
"Plug 'ixm-one/vim-cmake', { 'for': 'cmake' }
call plug#end()

if executable('rg') | set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case | endif

setglobal termencoding=utf-8
set encoding=utf-8
scriptencoding utf-8

set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set list

set shortmess+=aoOTI
set background=dark
set laststatus=2
set wildmenu

set foldlevelstart=10 foldnestmax=10 foldenable
set showmatch matchtime=1

set cursorline colorcolumn=80
set softtabstop=-1 tabstop=2 shiftwidth=2

set virtualedit=block
set nrformats=hex
set diffopt+=vertical

set nomodeline noswapfile
set ignorecase smartcase
set incsearch hlsearch
set expandtab smarttab
set number ruler

set cinoptions=N-s
set updatetime=2000
set autoindent

set visualbell
set autochdir

set hidden

function! s:command(name, ...)
  return getcmdtype() == ':' && getcmdline() =~# '^' .. a:name
        \ ? join(a:000, ' ')
        \ : a:name
endfunction 

cnoreabbrev <expr> grc <SID>command("grc", "edit<space>$MYGVIMRC")
cnoreabbrev <expr> rc <SID>command("rc", "edit<space>$MYVIMRC")

cnoreabbrev <expr> restore <SID>command("restore", "GitGutterUnstageHunk")
cnoreabbrev <expr> stage <SID>command("stage", "GitGutterStageHunk")

cnoreabbrev <expr> refresh <SID>command("refresh", "filetype<space>detect")

cnoreabbrev <expr> reload <SID>command("reload", "source<space>$MYVIMRC")
cnoreabbrev <expr> chmod <SID>command("chmod", "Chmod")

cnoreabbrev <expr> find <SID>command("find", "Files<space>$HOME/Desktop")
cnoreabbrev <expr> rm <SID>command("rm", "Delete")
cnoreabbrev <expr> ls <SID>command("ls", "Buffers")

cnoreabbrev <expr> json <SID>command("json", "%!python", "-m", "json.tool")

cnoreabbrev <expr> lgrep <SID>command("lgrep", "silent<space>lgrep")

let mapleader = "," " Almost everyone used to do this...

" global plugin options
let g:neosnippet#snippets_directory = expand('$HOME/.vim/snippets') " neosnippet
let g:neosnippet#disable_runtime_snippets = { '_' : 1 }       " neosnippet

let g:cpp_class_scope_highlight = 1
let g:cpp_concepts_highlight = 1
let g:rust_recommended_style = 0

let g:gitgutter_map_keys = 0
if executable('rg') | let g:gitgutter_grep = 'rg --color never' | endif

" github icons

let g:gitgutter_sign_removed_first_line = "\uf476"
let g:gitgutter_sign_modified_removed = "\uf5a"
let g:gitgutter_sign_modified = "\uf459"
let g:gitgutter_sign_removed = "\uf458"
let g:gitgutter_sign_added = "\uf457"

let g:fzf_layout = #{ up: "~20%" }

let g:mundo_prefer_python3 = 1
let g:mundo_right = 1

let g:netrw_liststyle = 3
let g:netrw_winsize = 30
let g:netrw_banner = 0
let g:netrw_menu = 0

let g:lightline =<< trim STATUS
  #{
      colorscheme: 'onedark',
      active: #{
        left: [
          ['mode', 'paste'],
          ['fugitive', 'readonly', 'filename', 'modified']
        ]
      },
      component : #{ lineinfo: "\ue0a1 %3l:%-2v" },
      component_function : #{
        readonly: 'LightlineReadonly',
        fugitive: 'LightlineFugitive'
      },
      separator: #{ left: "\ue0b0", right: "\ue0b2" },
      subseparator: #{ left: "\ue0b1", right: "\ue0b3" }
   }
STATUS

let g:lightline = eval(join(g:lightline, ' '))

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

nnoremap [f :lprevious<CR>
nnoremap ]f :lnext<CR>

" Open a new vertical or horizontal split
nnoremap <leader>v :vsplit<cr>
nnoremap <leader>h :split<cr>

" Open a new vertical or horizontal split and switch to it.
nnoremap <leader>vs <C-w>v<C-w>l
nnoremap <leader>hs <C-w>s<C-w>j

" turn off search highlight
nnoremap <leader><space> :silent! call setreg('/', '')<CR>

nnoremap <leader>g :GitGutterLineHighlightsToggle<CR>
nnoremap <leader>u :MundoToggle<CR>

" This is useful for those languages where I do things
nnoremap <F5> :silent make<cr>
nnoremap <F4> :cclose<cr>

nmap <C-PageDown> <Plug>(GitGutterNextHunk)
nmap <C-PageUp> <Plug>(GitGutterPrevHunk)

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

colorscheme onedark

function! s:syntax()
  let highlight = synIDattr(synID(line('.'), col('.'), 1), 'name')
  let group = synIDattr(synID(line('.'),col('.'), 0), 'name')
  let link = synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")
  return printf("hi<%s> trans<%s> lo<%s>", highlight, group, link)
endfunction

map <script> <Plug>(vimrc-syntax) :echo <SID>syntax()<CR>
map <F10> <Plug>(vimrc-syntax)
