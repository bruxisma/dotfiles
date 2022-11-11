" increase the size of course
set lines=54 columns=180
set colorcolumn=80

set guioptions-=T " Remove all those icons I never use
set guioptions=aegm " But keep the stuff I do!

if has('mac')
  set guifont=Consolas\ Bold:h12
elseif has('win32') || has('win64')
  set guifont=Consolas:h12:b:cANSI
  " Its about time someone made gvim use Direct2D :D
  set renderoptions=type:directx,
      \gamma:1.5,
      \contrast:0.5,
      \geom:1,
      \renmode:5,
      \taamode:1,
      \level:0.5
else
  set gfn=Source\ Code\ Pro\ 10
endif

" insert mode
inoremap <C-s> <ESC>
nnoremap <C-s> i
