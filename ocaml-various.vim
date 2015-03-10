" Text objs (requires kana/vim-textobj-user)

call textobj#user#plugin('ocamlidentifier', {
\   'identifier': {
\     'pattern': '\(\w\|\.\)\+',
\     'select': ['ac', 'ic'],
\   },
\ })

call textobj#user#plugin('ocamllet', {
\   'code': {
\     'pattern': ['\<let \w\+ =\s\?', '\s\?\<in\>'],
\     'select-a': 'al',
\     'select-i': 'il',
\   },
\ })

" Some navigation helpers (not motions)

noremap ]r :call search("^\\s*\\zslet")<cr>
noremap [r :call search("^\\s*\\zslet", "b")<cr>

" these two don't work with nested modules (yet)
noremap ]d :call search("^let")<cr>
noremap [d :call search("^let", "b")<cr>

" fixing little annoyances:
" change
" foo
" -> bar
" :  baz
" to
" foo
" :  bar
" -> baz
" to allow for easier reordering

function! s:FixTypeDecls()
  let pos = getpos(".")
  silent keepjumps %s/^\s*\zs:\s*/-> /ge
  silent keepjumps %s/val \w\+\n\s*\zs->\s*/:  /ge
  call setpos(".", pos)                                                                                                                                                   
endfunction

augroup MLI
  autocmd!
  autocmd BufWritePre *.mli silent call s:FixTypeDecls()                                                                                                                  
augroup END

" Bringing a function definition to all args on one line to one arg per line
" unsure how useful this actually is. multi -> one is easy with v/=J, one -> multi is a bit annoying though.
" atm this fails on optional args with defaults, shouldn't be hard to fix

function! s:ToOneLine()
  normal! j
  ?^let
  while match(getline("."), "=") <= 0
    normal! J
  endwhile
endfunction
command! -nargs=0 Uno call s:ToOneLine()

function! s:ToMultiLine()
  normal! _w
  while match(getline("."), "^\\s*=\\s*$") < 0
    normal! f r^M
  endwhile
endfunction
command! -nargs=0 Multi call s:ToMultiLine()
