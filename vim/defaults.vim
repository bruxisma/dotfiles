" Here are *my* sensible defaults :)
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

set runtimepath-=$HOME/vimfiles/after
set runtimepath-=$HOME/vimfiles
set runtimepath+=$HOME/.vim/after
set runtimepath^=$HOME/.vim

set packpath-=$HOME/vimfiles/after
set packpath-=$HOME/vimfiles
set packpath+=$HOME/.vim/after
set packpath^=$HOME/.vim

if !$XDG_CONFIG_HOME && !has('unix') | let $XDG_CONFIG_HOME = $APPDATA | endif
if !$XDG_CACHE_HOME && !has('unix') | let $XDG_CACHE_HOME = $LOCALAPPDATA | endif
if !$XDG_STATE_HOME && !has('unix') | let $XDG_STATE_HOME = $LOCALAPPDATA | endif
if !$XDG_DATA_HOME && !has('unix') | let $XDG_DATA_HOME = $LOCALAPPDATA | endif

if !$XDG_CONFIG_HOME | let $XDG_CONFIG_HOME = expand('$HOME/.config') | endif
if !$XDG_CACHE_HOME | let $XDG_CACHE_HOME = expand('$HOME/.cache') | endif
if !$XDG_STATE_HOME | let $XDG_STATE_HOME = expand('$HOME/.local/state') | endif
if !$XDG_DATA_HOME | let $XDG_DATA_HOME = expand('$HOME/.local/share') | endif

set viminfofile=$XDG_STATE_HOME/vim/viminfo

set backupdir=$XDG_STATE_HOME/vim/backup
set directory=$XDG_STATE_HOME/vim/swap
set undodir=$XDG_STATE_HOME/vim/undo
set viewdir=$XDG_DATA_HOME/vim/view

call mkdir(&backupdir, 'p', 0700)
call mkdir(&directory, 'p', 0700)
call mkdir(&viewdir, 'p', 0700)
call mkdir(&undodir, 'p', 0700)
