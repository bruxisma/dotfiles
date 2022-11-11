let $MYRUNTIME = printf("%s/vim", expand('<sfile>:p')->resolve()->fnamemodify(':h'))

if !has('nvim') | source $VIMRUNTIME/defaults.vim | endif
source $MYRUNTIME/defaults.vim

if empty(glob('$HOME/.vim/autoload/plug.vim'))
  silent !curl -fLo $MYRUNTIME/autoload/plug.vim --create-dirs
        \ https://github.com/junegunn/vim-plug/raw/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if executable('rg') 
  set grepformat^=%f:%l%c:%m
  set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
endif
if !$WT_SESSION->empty() | set t_Co=256 | endif

set listchars=tab:»\ ,extends:▶,precedes:◀,nbsp:␣,trail:·
set list

set background=dark
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

set updatetime=2000
set autoindent

set autochdir

set hidden

let mapleader = "," " Almost everyone used to do this...

" Plugins {{{ 
call plug#begin('$MYRUNTIME/bundle')

Plug 'Shougo/neosnippet.vim'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'tpope/vim-eunuch'
Plug 'simnalamburt/vim-mundo', { 'on': 'MundoToggle' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } | Plug 'junegunn/fzf.vim'
Plug 'godlygeek/tabular'
Plug 'dense-analysis/ale'
Plug 'editorconfig/editorconfig-vim'

Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'plasticboy/vim-markdown'
Plug 'rust-lang/rust.vim'
Plug 'jparise/vim-graphql', { 'for': 'graphql' }
Plug 'HerringtonDarkholme/yats.vim'
Plug 'pangloss/vim-javascript', { 'for': 'js' }
Plug 'zigford/vim-powershell', { 'for': 'powershell' }
Plug 'lepture/vim-jinja', { 'for': 'jinja' }
Plug 'cespare/vim-toml', { 'for': 'toml', 'branch': 'main' }
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoUpdateBinaries' }
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plug 'hashivim/vim-terraform'
Plug 'tpope/vim-liquid'
Plug 'pboettch/vim-cmake-syntax'
Plug 'pest-parser/pest.vim', { 'for': 'pest' }
Plug 'earthly/earthly.vim', { 'branch': 'main' }
Plug 'NoahTheDuke/vim-just'
Plug 'bruxisma/gitmoji.vim'
"Plug '~/Desktop/ixm/vim-cmake' ", { 'for': 'cmake' }
"Plug 'ixm-one/vim-cmake', { 'for': 'cmake' }
call plug#end()

function! s:command(name, ...)
  return getcmdtype() == ':' && getcmdline() =~# '^' .. a:name
        \ ? join(a:000, ' ')
        \ : a:name
endfunction 

cnoreabbrev <expr> grc <SID>command("grc", "edit<Space>$MYGVIMRC")
cnoreabbrev <expr> rc <SID>command("rc", "edit<Space>$MYVIMRC")

cnoreabbrev <expr> unstage <SID>command("unstage", "GitGutterUndoHunk")
cnoreabbrev <expr> stage <SID>command("stage", "GitGutterStageHunk")

cnoreabbrev <expr> refresh <SID>command("refresh", "filetype<Space>detect")

cnoreabbrev <expr> reload <SID>command("reload", "source<Space>$MYVIMRC")
cnoreabbrev <expr> chmod <SID>command("chmod", "Chmod")

cnoreabbrev <expr> find <SID>command("find", "Files<Space>$HOME/Desktop")
cnoreabbrev <expr> rm <SID>command("rm", "Delete")
cnoreabbrev <expr> ls <SID>command("ls", "Buffers")

cnoreabbrev <expr> json <SID>command("json", "%!jq<Space>.")

cnoreabbrev <expr> lgrep <SID>command("lgrep", "silent<Space>lgrep")
cnoreabbrev <expr> grep <SID>command("grep", "silent<Space>grep")

cnoreabbrev <expr> st <SID>command("st", "GFiles?")

smap <expr><Tab> neosnippet#expandable_or_jumpable()
  \ ? "\<plug>(neosnippet_expand_or_jump)"
  \ : "\<tab>"
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

if executable('fd') | inoremap <expr> <C-X><C-F> fzf#vim#complete#path('fd') | endif

inoremap <C-Space> <C-X><C-O>

inoremap <C-C> <Esc>
vnoremap <C-C> <Esc>

" Use perl/python style regex for searches
vnoremap / /\v
nnoremap / /\v

nnoremap [f :lprevious<CR>
nnoremap ]f :lnext<CR>

" Open a new vertical or horizontal split
nnoremap <Leader>v :vsplit<CR>
nnoremap <Leader>h :split<CR>

" Open a new vertical or horizontal split and switch to it.
nnoremap <Leader>vs <C-W>v<C-W>l
nnoremap <Leader>hs <C-W>s<C-W>j

" clear hlsearch
nnoremap <Leader><Space> :silent! call setreg('/', '')<CR>

nnoremap <Leader>g :GitGutterLineHighlightsToggle<CR>
nnoremap <Leader>u :MundoToggle<CR>

" This is useful for those languages where I do things
nnoremap <F5> :silent make<CR>
nnoremap <F4> :cclose<CR>

nmap <C-PageDown> <Plug>(GitGutterNextHunk)
nmap <C-PageUp> <Plug>(GitGutterPrevHunk)

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

function! s:syntax()
  let highlight = synID(line('.'), col('.'), 1)->synIDattr('name')
  let group = synID(line('.'), col('.'), 0)->synIDattr('name')
  let link = synID(line('.'), col('.'), 1)->synIDtrans()->synIDattr("name")
  return printf("hi<%s> trans<%s> lo<%s>", highlight, group, link)
endfunction

" Works on the entire file
" XXX: Why did I write this??
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

" global plugin options
let g:neosnippet#snippets_directory = expand('$MYRUNTIME/snippets') " neosnippet
let g:neosnippet#disable_runtime_snippets = { '_' : 1 }       " neosnippet

let g:cpp_class_scope_highlight = 1
let g:cpp_concepts_highlight = 1
let g:load_doxygen_syntax = 1
let g:rust_recommended_style = 0
let g:go_fmt_command = "gofmt"

" javascript
let g:javascript_plugin_jsdoc = 1

" sh.vim
let g:is_kornshell = 0
let g:is_posix = 1
let g:sh_fold_enabled = 3 " heredoc + function folding

let g:gitgutter_map_keys = 0
if executable('rg') | let g:gitgutter_grep = 'rg --color never' | endif

" github icons
let g:gitgutter_sign_removed_first_line = "\uf476"
let g:gitgutter_sign_modified_removed = "\uf45a"
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

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠'
let g:ale_fix_on_save = 1

let g:ale_linters =<< trim LINTERS
  #{
    javascript: ['eslint'],
    typescript: ['eslint'],
  }
LINTERS

let g:ale_fixers =<< trim FIXERS
  #{
    javascript: ['eslint'],
    typescript: ['eslint']
  }
FIXERS

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

let g:gitmoji_aliases =<< trim ALIASES
#{
  adhesive-bandage: ['patch'],
  alembic: ['try', 'experiment'],
  alien: ['extern', 'external'],
  ambulance: ['critical', 'hotfix'],
  chart-with-upwards-trend: ['analytics', 'stats'],
  arrow-down: ['downgrade'],
  arrow-up: ['upgrade'],
  art: ['format', 'fmt'],
  bento: ['assets', 'asset'],
  bookmark: ['version', 'release', 'tag'],
  boom: ['abi', 'break'],
  building-construction: ['architecture', 'arch'],
  bulb: ['comments', 'comment'],
  busts-in-silhouette: ['contrib', 'contributor', 'contributors'],
  camera-flash: ['snapshot'],
  card-file-box: ['database'],
  children-crossing: ['ux'],
  clown-face: ['mock'],
  coffin: ['dead'],
  construction: ['wip'],
  construction-worker: ['ci'],
  animation: ['animations'],
  fire: ['delete'],
  globe-with-meridians: ['translate', 'i18n', 'l10n'],
  goal-net: ['catch'],
  green-heart: ['fix-ci'],
  hammer: [ 'build' ],
  heavy-minus-sign: ['rm'],
  heavy-plus-sign: ['add'],
  iphone: ['mobile', 'responsive'],
  label: ['types', 'typing', 'type-safety'],
  lipstick: ['ui', 'style'],
  lock: ['cve'],
  loud-sound: ['logs', 'log'],
  monocle-face: ['inspect', 'data'],
  mute: ['quiet', 'silence'],
  page-facing-up: ['license'],
  passport-control: ['permissions', 'permission', 'roles', 'role', 'auth'],
  memo: ['docs'],
  pencil2: ['typos', 'typo'],
  pushpin: ['pin'],
  recycle: ['refactor'],
  rewind: ['revert'],
  rocket: ['deploy'],
  rotating-light: ['lint'],
  see-no-evil: ['ignore'],
  sparkles: ['feature', 'new'],
  speech-balloon: ['text'],
  test-tube: ['test-fail', 'failing-test', 'failing-tests', 'tdd'],
  triangular-flag-on-post:['flag', 'feature-flag'],
  truck: ['rename', 'mv', 'move'],
  twisted-rightwards-arrows: ['merge'],
  wastebasket: ['deprecated', 'deprecate'],
  wheelchair: ['a11y'],
  white-check-mark: ['test-pass', 'passing-test', 'passing-tests', 'tests', 'test'],
  wrench: ['configuration', 'config', 'cfg'],
  zap: ['performance', 'perf']
}
ALIASES

let g:gitmoji_aliases = eval(join(g:gitmoji_aliases))
let g:ale_linters = eval(join(g:ale_linters))
let g:ale_fixers = eval(join(g:ale_fixers))
let g:lightline = eval(join(g:lightline))


colorscheme gruvbox
