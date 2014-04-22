" Run arc lint and put the results into the quickfix list

function! s:ArcLint(args)
    let olderrorformat = &errorformat
    let oldmakeprg = &makeprg

    set errorformat=%f:%l:%m
    let &makeprg="arc lint --output compiler ".a:args
    silent make
    redraw!

    let &errorformat = olderrorformat
    let &makeprg = oldmakeprg
    copen
endfunction
command! -nargs=* ArcLint call s:ArcLint("<args>")
