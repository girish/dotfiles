set nocompatible
"set cindent
"set autoindent
filetype indent on
filetype plugin on
"let g:vimsh_prompt_pty  = "%m%"
"let g:vimsh_sh = "/bin/zsh"
set background=dark
map <C-a> :execute 'NERDTreeToggle '<CR>
" Initialize execute file list.
let g:VimShell_EnableInteractive = 1
let g:VimShell_EnableSmartCase = 1
let g:VimShell_EnableAutoLs = 1
set tabstop=4
set shiftwidth=4
set expandtab
set nosmarttab
set showcmd
"set wildmenu "Turn on WiLd menu
set laststatus=2
" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vim_runtime/vimrc
"set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
"map <F12> ggVGg?
" Set backspace config
set backspace=eol,start,indent
if has('win32') || has('win64') 
	" Display user name on Windows.
	let g:VimShell_Prompt = $USERNAME."% "
else
	" Display user name on Linux.
	let g:VimShell_Prompt = $USER."% "
endif
"imporve search by highlighting keyword and Searchig incrementally
set hlsearch
set incsearch
"set window title
set title
"Add jquery syntax to Javascript files
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

"autocmd BufEnter * lcd %:p:h
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a5

nmap :term :ConqueTerm bash 
