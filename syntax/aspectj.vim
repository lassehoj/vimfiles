if !exists("main_syntax")
  let main_syntax = 'aspectj'
endif
runtime syntax/java.vim
unlet b:current_syntax

syn keyword ajType pointcut declare warning call ajConstant

hi def link ajType Type

let b:current_syntax = "aspectj"

if main_syntax == 'aspectj'
  unlet main_syntax
endif
