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
  silent set guifont=Fira_Code_Retina:h12
  silent! set rop=type:directx,gamma:1.0,contrast:0.5,level:0.5,geom:1,renmode:5,taamode:1
else
  set guifont=Ubuntu\ Mono\ 16
endif

" Because of habit D:
nnoremap <C-S-B> :silent make<CR>
