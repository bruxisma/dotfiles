let s:gui = has('gui_running')
let s:osx = has('mac')

compiler cargo

" We manually change the buffer's directory to the directory containing the
" 'Cargo.toml' because Cargo gives errors relative to the path that it is
" executed in, while vim doesn't like that too much, especially since I use
" autochdir
function! CargoTool (command)
  write " save the buffer we're editing
  let s:current = getcwd() " get the current buffer's directory (autochdir)
  let s:manifest = findfile('Cargo.toml', '.;') " find the cargo manifest
  let s:root = fnamemodify(s:manifest, ':p:h') " find project root
  execute "lcd" fnameescape(s:root) | " change the current buffer's directory
  execute "silent" "make" a:command | " run the cargo command
  execute "lcd" s:current | " change back to the original directory
  cwindow " and now we open the error window if possible
endfunction

command! -nargs=1 CargoTool call CargoTool(<f-args>)

" Build, Test, Run commands for cargo
nnoremap <buffer> <F5> :CargoTool build<CR>
nnoremap <buffer> <F6> :CargoTool clean<CR>
nnoremap <buffer> <F7> :CargoTool bench<CR>
nnoremap <buffer> <F8> :CargoTool test<CR>

if s:gui
  nnoremap <buffer> <C-S-B> :CargoTool build<CR>
endif

" Probably against my better judgement to make this global, but WHATEVS
nnoremap <F4> :cclose<CR>

