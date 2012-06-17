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
"function! Send_to_conque(text)
"  if !exists("b:conque_repl")
"    let a:command = input('Interactive Command(irb, python): ')
"    let b:conque_repl =  conque_term#open(a:command, ['belowright vsplit'], 1)
"  endif
"  call b:conque_repl.write(a:text)
"endfunction
"vmap <C-x><C-x> "ry:call Send_to_conque(@r)<CR>
"nmap <C-x><C-x> var<C-x><C-x>

function! Conque_term_post_selected(type) "{{{

  " get most recent/relevant terminal
  let term = conque_term#get_instance()
  " shove visual text into @@ register
  let reg_save = @@
  sil exe "normal! `<" . a:type . "`>y"
  let @@ = substitute(@@, '^[\r\n]*', '', '')
  let @@ = substitute(@@, '[\r\n]*$', '', '')

  " go to terminal buffer
  call term.focus()

  " execute yanked text
  call term.writeln(@@)

  " reset original values
  let @@ = reg_save

  " scroll buffer left
  startinsert!
  normal! G$
  exe "normal! \<c-w>\<c-w>"

endfunction "}}}

vmap <C-x><C-x> :call Conque_term_post_selected(visualmode())<CR>
nmap <C-x><C-x> var<C-x><C-x>
