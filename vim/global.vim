" be 'modern'
set nocompatible
filetype off
filetype plugin indent on
syntax on

" prevent vim from adding that stupid empty line at the end of every file
set noeol
set binary

" presentation settings
"set number              " precede each line with its line number
set numberwidth=3       " number of culumns for line numbers
set textwidth=0         " Do not wrap words (insert)
set nowrap              " Do not wrap words (view)
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set ruler               " line and column number of the cursor position
set wildmenu            " enhanced command completion
"set visualbell          " use visual bell instead of beeping
set laststatus=2        " always show the status line
set title
set listchars=tab:▸\ ,eol:¬
set list

let mapleader = ","
"Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

"using 256 colors (or 88 colors) if your terminal supports it,
"but does not automatically use 256 colors by default.
set t_Co=256

colorscheme vividchalk
set background=dark

" highlight spell errors
hi SpellErrors guibg=red guifg=black ctermbg=red ctermfg=black

" status line
set statusline=%<%1*%f%*\ %h%m%r%#warningmsg#%{SyntasticStatuslineFlag()}%*%=%-14.(%l,%c%V%)\ %P
" highlihgt status line file name
"hi User1 term=bold,reverse cterm=bold ctermfg=4 ctermbg=2 gui=bold guifg=Black guibg=White
highlight User1  guifg=Black   guibg=#aabbee gui=bold ctermfg=Black ctermbg=White cterm=bold

" behavior
" ignore these files when completing names and in
" explorer
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif
set shell=/bin/bash     " use bash for shell commands
set autowriteall        " Automatically save before commands like :next and :make
set hidden              " enable multiple modified buffers
set history=1000
set autoread            " automatically read feil that has been changed on disk and doesn't have changes in vim
set backspace=indent,eol,start
set guioptions-=T       " disable toolbar"
set completeopt=menuone,preview
let bash_is_sh=1        " syntax shell files as bash scripts
set cinoptions=:0,(s,u0,U1,g0,t0 " some indentation options ':h cinoptions' for details
set modelines=5         " number of lines to check for vim: directives at the start/end of file
"set fixdel                 " fix terminal code for delete (if delete is broken but backspace works)

"set ts=4                " number of spaces in a tab
"set sw=4                " number of spaces for indent
"set et                  " expand tabs into spaces

" mouse settings
if has("mouse")
  set mouse=a
endif
set mousehide                           " Hide mouse pointer on insert mode."

" search settings
set incsearch           " Incremental search
set hlsearch            " Highlight search match
set ignorecase          " Do case insensitive matching
set smartcase           " do not ignore if search pattern has CAPS

" omni completion settings
"set ofu=syntaxcomplete#Complete
"let g:rubycomplete_buffer_loading = 0
"let g:rubycomplete_classes_in_global = 1

" directory settings
set backupdir=~/.backup,.       " list of directories for the backup file
set directory=~/.backup,~/tmp,. " list of directory names for the swap file
set nobackup            " do not write backup files
set noswapfile          " do not write .swp files

" folding
set foldcolumn=0        " columns for folding
set foldmethod=indent
set foldlevel=9
set nofoldenable        "dont fold by default "

set hidden
set nojoinspaces
set listchars=tab:▸\ ,eol:¬
" extended '%' mapping for if/then/else/end etc
runtime macros/matchit.vim



if has("autocmd")
  autocmd filetype html,css,scss,ruby,pml,yaml,coffee,vim setlocal ts=2 sts=2 sw=2 expandtab
  autocmd filetype javascript setlocal ts=4 sts=4 sw=4 noexpandtab
  "Add jquery syntax to Javascript files
  au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
  autocmd filetype markdown setlocal wrap linebreak nolist
  autocmd bufnewfile,bufread *.rss setfiletype xml
  autocmd bufnewfile,bufread rakefile,capfile,gemfile,termfile,config.ru setfiletype ruby
  autocmd filetype ruby :Abolish -buffer initialise initialize
  autocmd filetype vo_base :colorscheme solarized
endif

" http://stackoverflow.com/questions/2400264/is-it-possible-to-apply-vim-configurations-without-restarting/2400289#2400289
if has("autocmd")
  augroup myvimrchooks
    au!
    au bufwritepost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
    augroup end
endif
