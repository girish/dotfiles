set nocompatible
"set cindent
"set autoindent

filetype indent on
filetype plugin on
syntax on

" set background=dark

" Various mapping/shortcuts
map <C-a> :execute 'NERDTreeToggle '<CR>
map <C-x> :execute 'ConqueTerm bash'<CR>
"map <F12> ggVGg? " select whole file

call pathogen#runtime_append_all_bundles()

let mapleader=","
"Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR> 

" Show partial commands on status as I type
set showcmd

"set wildmenu Turn on WiLd menu
set laststatus=2

" When vimrc is edited, reload it
"autocmd! bufwritepost vimrc source ~/.vim_runtime/vimrc

"set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]

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

" autocmd BufEnter * lcd %:p:h " change directory to file opened

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
set list

nmap :term :ConqueTerm bash
set guifont=monaco\ 10
"set gfn=Monospace\ 10
""Make comments italic
"highlight Comment cterm=italic term=italic 
""ctermbg=None ctermfg=None 
"highlight Comment font=Bitstream_Vera_Sans_Mono_Oblique:h14
" IMPORTANT: Uncomment one of the following lines to force
" " using 256 colors (or 88 colors) if your terminal supports it,
" " but does not automatically use 256 colors by default.
set t_Co=256
"set t_Co=88
"if (&t_Co == 256 || &t_Co == 88) && !has('gui_running') &&
"			\ filereadable(expand("$HOME/.vim/plugin/guicolorscheme.vim"))
"	" Use the guicolorscheme plugin to makes 256-color or 88-color
"	" terminal use GUI colors rather than cterm colors.
"	runtime! plugin/guicolorscheme.vim
"	GuiColorScheme github
"else
"	" For 8-color 16-color terminals or for gvim, just use the
"	" regular :colorscheme command.
"	colorscheme github
"endif
colorscheme vividchalk
