set nocompatible

call pathogen#runtime_append_all_bundles()

"Adding highlight for whitespaces
source ~/.vim/bindings.vim
source ~/.vim/plugins.vim
source ~/.vim/global.vim
set number


if filereadable(expand("~/.vim_local"))
  source ~/.vim_local
endif


" Emulate repl
function! Send_to_conque(text)
  if !exists("b:conque_repl")
    let a:command = '/bin/bash ' . input('Interactive Command(irb, python): ')
    let b:conque_repl =  conque_term#open(a:command, ['vsplit'], 1)
  endif
  call b:conque_repl.write(a:text)
endfunction
vmap <C-x><C-x> "ry:call Send_to_conque(@r)<CR>
nmap <C-x><C-x> var<C-x><C-x>