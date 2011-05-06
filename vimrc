set nocompatible

call pathogen#runtime_append_all_bundles()

"Add jquery syntax to Javascript files
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery


source ~/.vim/global.vim
source ~/.vim/bindings.vim
source ~/.vim/plugins.vim

if filereadable(expand("~/.vim_local"))
  source ~/.vim_local
endif
