" Plugin (vundle/pathogen) file
" Language: Souffle datalog engine
" Maintainer: Nic H
" Latest Revision: 22 November 2016

if exists("g:loaded_souffle_vim_plugin")
      finish
endif
let g:loaded_souffle_vim_plugin = 1

au BufNewFile,BufRead *.dl setf souffle
