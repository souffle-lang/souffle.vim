" Vim syntax file
" Language: Souffle datalog engine
" Maintainer: Nic H
" Latest Revision: 22 November 2016

if exists("b:current_syntax")
  finish
endif

" Comments
syn region  souffleBlockComment  start="/\*" end="\*/" contains=souffleTodo
syn region  souffleInlineComment start="//" end="$" contains=souffleTodo
syn keyword souffleTodo          TODO FIXME NOTE contained

" Preprocessor directives
syn region  soufflePreproc       start="#" end="$" skip="\\$" keepend

" Type Declarations
syn match   souffleTypeDef       "\.type"

" Relation Declarations
syn keyword souffleIOControl     input output printsize
syn match   souffleDef           "\.decl[^)]*)" transparent contains=souffleDefKey,souffleDefBody
syn match   souffleDefKey        "\.decl" contained containedin=souffleDef
syn region  souffleDefBody       start="[a-zA-Z0-9_-]*(" end=")" transparent contained containedin=souffleDef contains=souffleDefCName,souffleDefCSep,souffleDefCTypesouffleDefRel
syn match   souffleDefRel        "[a-zA-Z0-9_-]*(" transparent contained containedin=souffleDefBody contains=souffleDefRelName
syn match   souffleDefRelName    "[a-zA-Z0-9_-]*" contained containedin=souffleDefRel
syn match   souffleDefCName      "[a-zA-Z0-9_-]*:[a-zA-Z0-9_-]*" contained containedin=souffleDefBody contains=souffleDefCType
syn match   souffleDefCSep       ":" contained containedin=souffleDefCType
syn match   souffleDefCType      ":[a-zA-Z0-9_-]*" contained containedin=souffleDefCName contains=souffleDefCSep

" Rules
syn region  souffleRule           start="[a-zA-Z0-9_-]*(" end="\." contains=souffleRuleHead,souffleRuleBody keepend
syn region  souffleRuleBody       start=":-" end="\." contained contains=souffleRuleBodyStart,souffleRuleBodyEnd,souffleRuleBodyTerm,souffleRuleBodySym keepend
syn match   souffleRuleHead       "[a-zA-Z0-9_-]*(" contained containedin=souffleRule contains=souffleRuleHeadName
syn match   souffleRuleHeadName   "[a-zA-Z0-9_-]*" contained containedin=souffleRuleHead
syn match   souffleRuleBodyTerm   "[a-zA-Z0-9_-]*(" contained containedin=souffleRuleBody contains=souffleRuleBodyTName
syn match   souffleRuleBodyTName  "[a-zA-Z0-9_-]*" contained containedin=souffleRuleBodyTerm
syn match   souffleRuleBodyStart  ":-" contained containedin=souffleRuleBody
syn match   souffleRuleBodyEnd    "\." contained containedin=souffleRuleBody
syn match   souffleRuleBodySym    "_" contained containedin=souffleRuleBody

let b:current_syntax = "souffle"

hi def link souffleBlockComment  Comment
hi def link souffleDefCSep       Special
hi def link souffleDefKey        Statement
hi def link souffleDefRelName    Type
hi def link souffleInlineComment Comment
hi def link souffleIOControl     Statement
hi def link soufflePreproc       PreProc
hi def link souffleRuleHeadName  Identifier
hi def link souffleRuleBodyTName Constant
hi def link souffleRuleBodyEnd   Special
hi def link souffleRuleBodyStart Special
hi def link souffleRuleBodySym   Special
hi def link souffleTodo          Todo
hi def link souffleTypeDef       Statement

