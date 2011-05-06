set nocompatible

call pathogen#runtime_append_all_bundles()

"Add jquery syntax to Javascript files
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery


source ~/.vim/plugins.vim
source ~/.vim/global.vim
source ~/.vim/bindings.vim


if filereadable(expand("~/.vim_local"))
  source ~/.vim_local
endif

