let s:windows = has('win32') || has('win64')
let s:osx = has('mac')

function! s:command(name, ...)
  return getcmdtype() == ':' && getcmdline() =~# '^' .. a:name
        \ ? join(a:000, ' ')
        \ : a:name
endfunction 

cnoreabbrev <expr> twitch <SID>command("twitch", "set columns=176 lines=60")
cnoreabbrev <expr> pwsh <SID>command("pwsh", "term ++close pwsh -NoLogo -WorkingDirectory %:p:h")

set guioptions=afgm
set columns=120
set lines=40

if s:osx
  set macligatures
  set guifont=DelugiaNerdFont-Regular:h16
elseif s:windows
  silent set guifont=Delugia_Nerd_Font:h14
  silent set guioptions+=!
  silent! set rop=type:directx,gamma:1.0,contrast:0.5,level:0.5,geom:1,renmode:5,taamode:1
else
  set guifont=Fira\ Code\ Retina\ 16
endif

" Because of habit D:
nnoremap <C-S-B> :silent make<CR>
