let s:windows = has('win32') || has('win64')
let s:osx = has('mac')

set guioptions-=T    " Remove all those icons I never use
set guioptions=aegm  " But keep the stuff I do!
set columns=120      " increase number of columns
set lines=40         " increase number of vertical lines

if s:osx
  set macligatures
  set guifont=Fira\ Code\ Retina:h16
elseif s:windows
  silent set guifont=Fira_Code_Medium:h16
  silent! set renderoptions=type:directx,
      \gamma:1.0, " monitor depedent
      \contrast:0.5,
      \level:0.5, " cleartype
      \geom:1,    " RGB
      \renmode:5, " natural symmetric
      \taamode:1  " cleartype
else
  set guifont=Ubuntu\ Mono\ 16
endif

" Because of habit D:
nnoremap <C-S-B> :silent make<CR>
