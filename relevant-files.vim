" grab the files that are modified in your current feature branch

function! RelevantFiles()
  let curBranch = system("git rev-parse --abbrev-ref HEAD")
  let files = system("git diff --name-only master..".curBranch)
  set errorformat=%f
  caddexpr split(files, "\n")
  copen
endfunction
command! Rel call RelevantFiles()
