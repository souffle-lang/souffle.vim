" Vim syntax file
" Language: Souffle datalog engine
" Maintainer: Nic H
" Latest Revision: 22 November 2016

if exists("b:current_syntax")
  finish
endif

" TODO got this from rust.vim, find somewhere to put it
"syn match   souffleIdentifier    "\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*" display contained

" Preprocessor directives
syn region  soufflePreproc       start="#" end="$" skip="\\$" keepend

" Declarations
syn keyword souffleIOControl     input output printsize
syn match   souffleDeclarations  "\.\%(decl\|type\)"

" Rules
syn match   souffleRuleHead      "^.*:-"
syn keyword souffleOperator      cat
syn match   souffleUnderscore    "_"

" Comments
syn region  souffleBlockComment  start="/\*" end="\*/" contains=souffleTodo
syn region  souffleInlineComment start="//" end="$" contains=souffleTodo
syn keyword souffleTodo          TODO FIXME NOTE contained

let b:current_syntax = "souffle"

hi def link souffleBlockComment  Comment
hi def link souffleDeclarations  Typedef
hi def link souffleIdentifier    Identifier
hi def link souffleInlineComment Comment
hi def link souffleIOControl     Statement
hi def link souffleOperator      Statement
hi def link soufflePreproc       PreProc
hi def link souffleRuleHead      Identifier
hi def link souffleTodo          Todo
hi def link souffleUnderscore    Special
