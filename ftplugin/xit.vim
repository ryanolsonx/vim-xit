if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

" don't spam the user when Vim is started in Vi compatibility mode
let s:cpo_save = &cpo
set cpo&vim

function! s:toggle(ln, char)
    let a = getline(a:ln)
    " check on 
    let b = substitute(a, '\v^(\s*)\[ \]', '\1[' .a:char. ']', '') 
    if a ==# b
      " check off
      let b = substitute(a, '\v^(\s*)\[' .a:char. '\]', '\1[ ]', '') 
    endif
    if a ==# b
      let b = substitute(a, '\v^(\s*)', '\1[ ] ', '')
    endif
    call setline(a:ln, b)
    return len(b) - len(a)
endfunction

function! xit#ToggleBox(char, visual)
  if !a:visual
    let l:l = line('.')
    let l:coldelta = s:toggle(l:l, a:char)
    let pos = getpos('.')
    let pos[2] += l:coldelta
    call setpos('.', pos)
  else
    let l:ls = line("'<")
    let l:le = line("'>")
    for l:i in range(l:ls, l:le)
      call s:toggle(l:i, a:char)
    endfor
  endif
endfunction

if get(g:, "xit_mapping_enabled", 1)
  nn <buffer> <silent> <Leader>xx :<C-u>call xit#ToggleBox('x', 0)<cr>
  nn <buffer> <silent> <Leader>x@ :<C-u>call xit#ToggleBox('@', 0)<cr>
  nn <buffer> <silent> <Leader>x~ :<C-u>call xit#ToggleBox('~', 0)<cr>
  vn <buffer> <silent> <Leader>xx :<C-u>call xit#ToggleBox('x', 1)<cr>
  vn <buffer> <silent> <Leader>x@ :<C-u>call xit#ToggleBox('@', 1)<cr>
  vn <buffer> <silent> <Leader>x~ :<C-u>call xit#ToggleBox('~', 1)<cr>
endif

" restore Vi compatibility settings
let &cpo = s:cpo_save
unlet s:cpo_save"
