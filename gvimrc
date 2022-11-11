let s:windows = has('win32') || has('win64')
let s:osx = has('mac')

set guioptions-=T   " Remove all those icons I never use
set guioptions=aegm " But keep the stuff I do!
set columns=180     " increase number of columns
set lines=54        " increase number of vertical lines

if s:osx
  set guifont=Office\ Code\ Pro:h13
elseif s:windows
  silent set guifont=Consolas:h12:b:cANSI
  " Its about time someone made gvim use Direct2D :D
  silent set renderoptions=type:directx,
      \gamma:1.5,
      \contrast:0.5,
      \geom:1,
      \renmode:5,
      \taamode:1,
      \level:0.5
else
  set guifont=Source\ Code\ Pro\ 10
endif
