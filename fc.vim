" format the command line you get from `fc` a bit more nicely - only sort of works

function! s:SetUpFc()
  set syntax=bash
  set filetype=bash
  normal! ggVGJ                                                                                                                                                                                                                     
  s/\(|\|>\)/\\\r  &/ge
endfunction

augroup fc
  autocmd!
  autocmd BufRead /tmp/bash-fc-* call s:SetUpFc()
augroup END
