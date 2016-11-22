" Vim syntax file
" Language: Souffle datalog engine
" Maintainer: Nic H
" Latest Revision: 22 November 2016

if exists("b:current_syntax")
  finish
endif

syn keyword souffleIOControl    input output printsize
syn match   souffleDeclarations "\.\%(decl\|type\)"

let b:current_syntax = "souffle"

hi def link souffleIOControl    Statement
hi def link souffleDeclarations Typedef
