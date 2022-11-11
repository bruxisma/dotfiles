let s:windows = has('win32') || has('win64')
let s:osx = has('mac')

set guioptions-=T    " Remove all those icons I never use
set guioptions=aegm  " But keep the stuff I do!
set columns=120      " increase number of columns
set lines=40         " increase number of vertical lines

if s:osx
  set guifont=Ubuntu\ Mono:h16
elseif s:windows
  silent set guifont=Ubuntu_Mono:h16:cANSI:qDRAFT
  " Its about time someone made gvim use Direct2D :D
  silent! set renderoptions=type:directx,
      \gamma:1.0,
      \contrast:0.5,
      \level:1,
      \geom:1,
      \renmode:5,
      \taamode:1,
else
  set guifont=Ubuntu\ Mono\ 16
endif

" Because of habit D:
nnoremap <C-S-B> :silent make<CR>
