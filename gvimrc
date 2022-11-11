let s:windows = has('win32') || has('win64')
let s:osx = has('mac')

set background=light " solarized light for gui
set guioptions-=T    " Remove all those icons I never use
set guioptions=aegm  " But keep the stuff I do!
set columns=160      " increase number of columns
set lines=50         " increase number of vertical lines

if s:osx
  set guifont=Ubuntu\ Mono:h16
elseif s:windows
  silent set guifont=Ubuntu_Mono:h16:cANSI:qDRAFT
  silent! set renderoptions=type:directx,
      \gamma:1.5,
      \contrast:0.5,
      \geom:1,
      \renmode:5,
      \taamode:1,
      \level:0.5
else
  set guifont=Ubuntu\ Mono\ 16
endif
