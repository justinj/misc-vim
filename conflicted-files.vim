" Load all the files in the current working tree which have conflicts into the quickfix list
function! ConflictFiles()
  let files = system("git diff --name-only --diff-filter=U")
  set errorformat=%f
  cexpr split(files, "\n")
  copen
endfunction
command! Con call ConflictFiles()
