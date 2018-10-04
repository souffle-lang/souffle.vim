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
syn match   souffleTypeDef       "\.type [-_\?a-zA-Z0-9]*" contains=souffleTypeHead,souffleTypeId
syn match   souffleTypeHead       "\.type" contained containedin=souffleTypeDef

" Idents
syn match   souffleRelId        "[a-zA-Z?_][a-zA-Z0-9?_][a-zA-Z0-9?_]*\|[a-zA-Z?]" contained containedin=souffleDefRel,souffleIORelNames,souffleRuleHead,souffleRuleBodyTerm
syn match   souffleVarId        "[a-zA-Z?_][a-zA-Z0-9?_][a-zA-Z0-9?_]*\|[a-zA-Z?]" contained containedin=souffleDefCName,souffleRuleHeadBody,souffleRuleTBody
syn match   souffleTypeId       "[a-zA-Z?_][a-zA-Z0-9?_][a-zA-Z0-9?_]*\|[a-zA-Z?]" contained containedin=souffleTypeDef,souffleDefCType
syn match   souffleConstantId   "\"[^\"]*\"\|[0-9][0-9]*" contained containedin=souffleRuleBody

" Operators
syn match souffleOp             "+\|-\|\*\|/\|<\|>\|=\|!" contained containedin=souffleRuleHeadBody,souffleRuleTBody,souffleRuleBody

" IO Directives
syn region  souffleIODirective   start="\(\.input\|\.output\|\.printsize\).*(" end=")" transparent contains=souffleIOKey,souffleIORelNames,souffleIOField
syn match   souffleIODirective   "\(\.input\|\.output\|\.printsize\)[^(]*$" transparent contains=souffleIORelNames
syn match   souffleIOKey         "^\.[a-z]*" contained containedin=souffleIODirective
syn match   souffleIORelNames    " [ ,a-zA-Z0-9?_-]*(" transparent contained containedin=souffleIODirective contains=souffleIORelName
syn match   souffleIORelNames    " [ ,a-zA-Z0-9?_-]*$" transparent contained containedin=souffleIODirective contains=souffleRelId
syn match   souffleIOField       "[a-zA-Z0-9]*=" contained containedin=souffleIODirective

" Relation Declarations
syn region  souffleDef           start="\.decl" end=")" contains=souffleDefKey,souffleDefBody keepend
syn match   souffleDefKey        "\.decl" contained containedin=souffleDef
syn region  souffleDefBody       start=" [ ,a-zA-Z0-9?_-]*(" end=")" transparent contained containedin=souffleDef contains=souffleDefCName,souffleDefCSep,souffleDefCType,souffleDefRel
syn match   souffleDefRel        "[^(]*(" transparent contained containedin=souffleDefBody contains=souffleRelId
syn match   souffleDefCName      "[a-zA-Z0-9?_-]* *: *[a-zA-Z0-9?_-]*" contained containedin=souffleDefBody contains=souffleVarId,souffleDefCType
syn match   souffleDefCSep       ":" contained containedin=souffleDefCType
syn match   souffleDefCType      ": *[a-zA-Z0-9?_-]*" contained containedin=souffleDefCName contains=souffleDefCSep,souffleTypeId

" Rules
syn region  souffleRule           start="[a-zA-Z0-9?_-]*(" end="\." contains=souffleRuleHead,souffleRuleBody keepend
syn match   souffleRuleHead       "[a-zA-Z0-9?_-]*([^)]*)" contained containedin=souffleRule contains=souffleRelId,souffleRuleHeadBody keepend
syn match   souffleRuleHeadBody   "(.*)" contained containedin=souffleRuleHead contains=souffleVarId,souffleConstantId,souffleOp
syn region  souffleRuleBody       start=":-" end="\." contained contains=souffleRuleBodyStart,souffleRuleBodyEnd,souffleRuleBodyTerm,souffleConstantId,souffleOp,souffleVarId keepend
syn match   souffleRuleBodyStart  ":-" contained containedin=souffleRuleBody
syn match   souffleRuleBodyEnd    "\." contained containedin=souffleRuleBody
syn match   souffleRuleBodyTerm   "[a-zA-Z0-9?_-]*([^)]*)" contained containedin=souffleRuleBody contains=souffleRelId,souffleRuleTBody
syn match   souffleRuleTBody      "([^)]*)" contained containedin=souffleRuleBodyTerm contains=souffleVarId,souffleRuleTBodySym,souffleConstantId
syn match   souffleRuleTBodySym   "_" contained containedin=souffleRuleTBody

let b:current_syntax = "souffle"

hi def link souffleBlockComment  Comment
hi def link souffleDefCSep       Special
hi def link souffleDefKey        Statement
hi def link souffleInlineComment Comment
hi def link souffleIOKey         Statement
hi def link souffleIOField       PreProc
hi def link soufflePreproc       PreProc
hi def link souffleRuleBodyEnd   Special
hi def link souffleRuleBodyStart Special
hi def link souffleRuleBodySym   Special
hi def link souffleTodo          Todo
hi def link souffleTypeHead      Statement
hi def link souffleRelId         Type
hi def link souffleVarId         Identifier
hi def link souffleConstantId    Constant
hi def link souffleOp            Special
hi def link souffleTypeId        PreProc
