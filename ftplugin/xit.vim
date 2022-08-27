if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

" don't spam the user when Vim is started in Vi compatibility mode
let s:cpo_save = &cpo
set cpo&vim

setlocal cursorline

function! xit#ToggleBox(char)
  let a = getline('.')
  " check on 
  let b = substitute(a, '\v^(\s*)\[ \]', '\1[' .a:char. ']', '') 
  if a ==# b
    " check off
    let b = substitute(a, '\v^(\s*)\[' .a:char. '\]', '\1[ ]', '') 
  endif
  if a ==# b
    let b = substitute(a, '\v^(\s*)', '\1[ ] ', '')
  endif
  call setline('.', b)
  let pos = getpos('.')
  let pos[2] += len(b) - len(a)
  call setpos('.', pos)
endfunction

if get(g:, "xit_mapping_enabled", 1)
  nn <buffer> <silent> <Leader>xx :<C-u>call xit#ToggleBox('x')<cr>
  nn <buffer> <silent> <Leader>x@ :<C-u>call xit#ToggleBox('@')<cr>
  nn <buffer> <silent> <Leader>x~ :<C-u>call xit#ToggleBox('~')<cr>
endif

" restore Vi compatibility settings
let &cpo = s:cpo_save
unlet s:cpo_save"
