" Vim syntax file
" Language: Souffle datalog engine
" Maintainer: Nic H
" Latest Revision: 22 November 2016

if exists("b:current_syntax")
  finish
endif

" Comments
syn region  souffleBlockComment  start="/\*" end="\*/"
syn region  souffleInlineComment start="//" end="$"

syn keyword souffleOperator      cat
syn keyword souffleIOControl     input output printsize
syn match   souffleDeclarations  "\.\%(decl\|type\)"

syn region soufflePreproc        start="#" end="$" skip="\\$" keepend

syn match   souffleRuleHead      "^.*:-"

syn match   souffleUnderscore    "_"

let b:current_syntax = "souffle"

hi def link souffleBlockComment  Comment
hi def link souffleInlineComment Comment

hi def link souffleIOControl     Statement
hi def link souffleOperator      Statement

hi def link soufflePreproc       PreProc

hi def link souffleRuleHead      Identifier

hi def link souffleDeclarations  Typedef

hi def link souffleUnderscore    Special
