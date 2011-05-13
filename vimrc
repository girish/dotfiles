set nocompatible

call pathogen#runtime_append_all_bundles()



source ~/.vim/plugins.vim
source ~/.vim/global.vim
source ~/.vim/bindings.vim
set number


if filereadable(expand("~/.vim_local"))
  source ~/.vim_local
endif