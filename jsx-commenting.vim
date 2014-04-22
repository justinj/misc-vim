" Contextual commenting for commentary.vim in jsx files.


function! s:SetCommentString()
  let stack = map(synstack(line("."), col(".")), "synIDattr(synIDtrans(v:val), 'name')")
  let cstr=&commentstring
  for id in stack
    if id[0:1] ==# "js"
      let cstr="//%s"
    endif
    if id[0:2] ==# "jsx"
      let cstr="{/*%s*/}"
    endif
  endfor
  let &commentstring=cstr
endfunction

autocmd CursorMoved *.jsx call s:SetCommentString()
