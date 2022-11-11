let $MYRUNTIME = printf("%s/vim", $MYVIMRC->resolve()->fnamemodify(':h'))

source $VIMRUNTIME/defaults.vim
source $MYRUNTIME/defaults.vim

if empty(glob('$HOME/.vim/autoload/plug.vim'))
  silent !curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs
        \ https://github.com/junegunn/vim-plug/raw/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if executable('rg') | set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case | endif
if !$WT_SESSION->empty() | set t_Co=256 | endif

set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set list

set background=dark
set wildmenu

set foldlevelstart=10 foldnestmax=10 foldenable
set showmatch matchtime=1

set cursorline colorcolumn=80
set softtabstop=-1 tabstop=2 shiftwidth=2

set virtualedit=block
set nrformats=hex
set diffopt+=vertical

set ignorecase smartcase
set incsearch hlsearch
set expandtab smarttab

set updatetime=2000
set autoindent

set autochdir

set hidden

" Plugins {{{ 
call plug#begin('$HOME/.vim/bundle')

Plug 'Shougo/neosnippet.vim'

Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'tpope/vim-eunuch'
Plug 'simnalamburt/vim-mundo', { 'on': 'MundoToggle' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } | Plug 'junegunn/fzf.vim'
Plug 'godlygeek/tabular'

Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'plasticboy/vim-markdown'
Plug 'rust-lang/rust.vim'
Plug 'jparise/vim-graphql', { 'for': 'graphql' }
Plug 'HerringtonDarkholme/yats.vim', { 'for': 'typescript' }
Plug 'othree/yajs.vim', { 'for': 'js' }
Plug 'zigford/vim-powershell', { 'for': 'powershell' }
Plug 'lepture/vim-jinja', { 'for': 'jinja' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
"Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoUpdateBinaries' }
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plug 'hashivim/vim-terraform'
Plug 'tpope/vim-liquid'
Plug 'pboettch/vim-cmake-syntax'
Plug 'pest-parser/pest.vim', { 'for': 'pest' }
Plug 'earthly/earthly.vim', { 'branch': 'main' }
"Plug '~/Desktop/ixm/vim-cmake' ", { 'for': 'cmake' }
"Plug 'ixm-one/vim-cmake', { 'for': 'cmake' }
call plug#end()

function! s:command(name, ...)
  return getcmdtype() == ':' && getcmdline() =~# '^' .. a:name
        \ ? join(a:000, ' ')
        \ : a:name
endfunction 

cnoreabbrev <expr> grc <SID>command("grc", "edit<space>$MYGVIMRC")
cnoreabbrev <expr> rc <SID>command("rc", "edit<space>$MYVIMRC")

cnoreabbrev <expr> unstage <SID>command("unstage", "GitGutterUndoHunk")
cnoreabbrev <expr> stage <SID>command("stage", "GitGutterStageHunk")

cnoreabbrev <expr> refresh <SID>command("refresh", "filetype<space>detect")

cnoreabbrev <expr> reload <SID>command("reload", "source<space>$MYVIMRC")
cnoreabbrev <expr> chmod <SID>command("chmod", "Chmod")

cnoreabbrev <expr> find <SID>command("find", "Files<space>$HOME/Desktop")
cnoreabbrev <expr> rm <SID>command("rm", "Delete")
cnoreabbrev <expr> ls <SID>command("ls", "Buffers")

cnoreabbrev <expr> json <SID>command("json", "%!jq<space>.")

cnoreabbrev <expr> lgrep <SID>command("lgrep", "silent<space>lgrep")
cnoreabbrev <expr> grep <SID>command("grep", "silent<space>grep")

cnoreabbrev <expr> st <SID>command("st", "GFiles?")

let mapleader = "," " Almost everyone used to do this...

" global plugin options
let g:neosnippet#snippets_directory = expand('$HOME/.vim/snippets') " neosnippet
let g:neosnippet#disable_runtime_snippets = { '_' : 1 }       " neosnippet

let g:cpp_class_scope_highlight = 1
let g:cpp_concepts_highlight = 1
let g:load_doxygen_syntax=1
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

let g:gruvbox_contrast_dark = 'hard'

let g:vim_markdown_no_default_key_mappings = 1

let g:lightline =<< trim STATUS
  #{
      colorscheme: 'gruvbox',
      active: #{
        left: [
          ['mode', 'paste'],
          ['readonly', 'filename', 'modified']
        ]
      },
      component : #{ lineinfo: "\ue0a1 %3l:%-2v" },
      component_function : #{
        readonly: 'LightlineReadonly',
      },
      separator: #{ left: "\ue0b0", right: "\ue0b2" },
      subseparator: #{ left: "\ue0b1", right: "\ue0b3" }
   }
STATUS

let g:lightline = eval(join(g:lightline, ' '))

smap <expr><tab> neosnippet#expandable_or_jumpable()
  \ ? "\<plug>(neosnippet_expand_or_jump)"
  \ : "\<tab>"
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

if executable('fd') | inoremap <expr> <C-x><C-f> fzf#vim#complete#path('fd') | endif

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

" clear hlsearch
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

colorscheme gruvbox

function! s:syntax()
  let highlight = synID(line('.'), col('.'), 1)->synIDattr('name')
  let group = synID(line('.'), col('.'), 0)->synIDattr('name')
  let link = synID(line('.'), col('.'), 1)->synIDtrans()->synIDattr("name")
  return printf("hi<%s> trans<%s> lo<%s>", highlight, group, link)
endfunction

" Works on the entire file
function! s:sortdictfile() range
  let width = &textwidth
  setlocal textwidth=1
  normal ggVGgq
  sort
  %join
  let &l:textwidth = l:width
endfunction

map <script> <Plug>(vimrc-sort-dictionary) :eval <SID>sortdictfile()<CR>
map <C-F11> <Plug>(vimrc-sort-dictionary)

map <script> <Plug>(vimrc-syntax) :echo <SID>syntax()<CR>
map <F10> <Plug>(vimrc-syntax)

if executable('bat')
  let s:fzf_buffer_preview = 'bat --color=always --style=numbers --pager=never {4}'
  let s:fzf_buffer_options = #{ options: ['--preview', s:fzf_buffer_preview] }

  command! -bang -nargs=? -complete=buffer Buffers 
    \ call fzf#vim#buffers(<q-args>, s:fzf_buffer_options, <bang>0)
endif
