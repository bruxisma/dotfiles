function! LightlineReadonly()
  return &readonly ? "\ue0a2" : ''
endfunction

function! LightlineFugitive()
  if exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? "\ue0a0 " . branch : ''
  endif
  return ''
endfunction
