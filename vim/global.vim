" be 'modern'
set nocompatible

filetype plugin on 
filetype indent on
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

let mapleader=","
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
"hi User1 term=bold,reverse cterm=bold ctermfg=4 ctermbg=2 gui=bold guifg=Blue

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

" extended '%' mapping for if/then/else/end etc
runtime macros/matchit.vim

" folding cheet sheet 
" zr	open all folds
" zm	close all folds
" za	toggle fold at cursor position
" zj	move down to start of next fold
" zk	move up to end of previous fold
" let g:getlatestvimscripts_allowautoinstall=1

" an example for a vimrc file. {{{1
"
" maintainer:	bram moolenaar <bram@vim.org>
" last change:	2008 jul 02
"
" to use it, copy it to
"     for unix and os/2:  ~/.vimrc
"	      for amiga:  s:.vimrc
"  for ms-dos and win32:  $vim\_vimrc
"	    for openvms:  sys$login:.vimrc




" ctrl-u in insert mode deletes a lot.	use ctrl-g u to first break undo,
" so that you can undo ctrl-u after inserting a line break.
inoremap <c-u> <c-g>u<c-u>
" convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" only define it when not defined already.
if !exists(":difforig")
  command Difforig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" preferences {{{1
set visualbell t_vb=
"set cursorline
"set tabstop=4
"set softtabstop=4
"set shiftwidth=4
"set expandtab
set hidden
set nojoinspaces
set listchars=tab:▸\ ,eol:¬
"set spelllang=en_gb
" put swap files in /tmp file
"set backupdir=~/tmp
"set directory=~/tmp
if has("autocmd")
  autocmd filetype html,css,scss,ruby,pml,yaml,coffee,vim setlocal ts=2 sts=2 sw=2 expandtab
  autocmd filetype javascript setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd filetype markdown setlocal wrap linebreak nolist
  autocmd bufnewfile,bufread *.rss setfiletype xml
  autocmd bufnewfile,bufread rakefile,capfile,gemfile,termfile,config.ru setfiletype ruby
  autocmd filetype ruby :abolish -buffer initialise initialize
  autocmd filetype vo_base :colorscheme solarized
endif

" toggles & switches (leader commands) {{{1
let mapleader = ","
nmap <silent> <leader>l :set list!<cr>
nmap <silent> <leader>w :set wrap!<cr>
nmap <silent> <buffer> <leader>s :set spell!<cr>
nmap <silent> <leader>n :silent :nohlsearch<cr>
nmap <silent> <leader>c :indentguidestoggle<cr>
command! -nargs=* Wrap set wrap linebreak nolist
command! -nargs=* Maxsize set columns=1000 lines=1000
" ctags {{{1
map <leader>rt :!ctags --extra=+f -r *<cr><cr>
let tlist_markdown_settings='markdown;h:headings'
let tlist_show_one_file=1
nmap <leader>/ :tlisttoggle<cr>

" mappings {{{1
" speed up buffer switching {{{2
map <c-k> <c-w>k
map <c-j> <c-w>j
map <c-h> <c-w>h
map <c-l> <c-w>l
" speed up tab switching {{{2
map <a-s-]> gt
map <a-s-[> gt
map <a-1> 1gt
map <a-2> 2gt
map <a-3> 3gt
map <a-4> 4gt
map <a-5> 5gt
map <a-6> 6gt
map <a-7> 7gt
map <a-8> 8gt
map <a-9> 9gt
map <a-0> :tablast<cr>
" shortcuts to make it easier to explore wrapped lines {{{2
" these come in handy when the following settings are enabled:
"     :set linebreak wrap nolist
vmap <a-j> gj
vmap <a-k> gk
vmap <a-4> g$
vmap <a-6> g^
vmap <a-0> g^
nmap <a-j> gj
nmap <a-k> gk
nmap <a-4> g$
nmap <a-6> g^
nmap <a-0> g^
" shortcuts for opening file in same directory as current file {{{2
cnoremap %% <c-r>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%
map <leader>er :e <c-r>=expand("%:r")."."<cr>
" shortcuts for visual selections {{{2
nmap gV `[v`]
" Alignment commands {{{1
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif
" TextObject tweaks {{{1
nnoremap viT vitVkoj
nnoremap vaT vatV
" Insert mode mappings {{{1
" emacs style jump to end of line
imap <C-e> <C-o>A
imap <C-a> <C-o>I
" Open line above (ctrl-shift-o much easier than ctrl-o shift-O)
imap <C-Enter> <C-o>o
imap <C-S-Enter> <C-o>O
" Easily modify vimrc {{{1
nmap <leader>v :e $MYVIMRC<CR>
" http://stackoverflow.com/questions/2400264/is-it-possible-to-apply-vim-configurations-without-restarting/2400289#2400289
if has("autocmd")
  augroup myvimrchooks
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
  augroup END
endif

" Custom commands and functions {{{1
" Create a :Quickfixdo command, to match :argdo/bufdo/windo {{{2
" Define a command to make it easier to use
command! -nargs=* Qargs execute 'args ' . QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(values(buffer_numbers))
endfunction

command! -nargs=+ QFDo call QFDo(<q-args>)
" Function that does the work
function! QFDo(command)
  " Create a dictionary so that we can get the list of buffers rather than
  " the list of lines in buffers (easy way to get unique entries)
  let buffer_numbers = {}
  " For each entry, use the buffer number as a dictionary key (won't get
  " repeats)
  for fixlist_entry in getqflist()
    let buffer_numbers[fixlist_entry['bufnr']] = 1
  endfor
  " Make it into a list as it seems cleaner
  let buffer_number_list = keys(buffer_numbers)

  " For each buffer
  for num in buffer_number_list
    " Select the buffer
    exe 'buffer' num
    " Run the command that's passed as an argument
    exe a:command
    " Save if necessary
    update
  endfor
endfunction
" http://stackoverflow.com/questions/4792561/how-to-do-search-replace-with-ack-in-vim
" Show syntax highlighting groups for word under cursor {{{2
" Tip: http://stackoverflow.com/questions/1467438/find-out-to-which-highlight-group-a-particular-keyword-symbol-belongs-in-vim
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
	return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
" Wipe all buffers which are not active (i.e. not visible in a window/tab) {{{2
" http://stackoverflow.com/questions/2974192/how-can-i-pare-down-vims-buffer-list-to-only-include-active-buffers
" http://stackoverflow.com/questions/1534835/how-do-i-close-all-buffers-that-arent-shown-in-a-window-in-vim
command! -nargs=* Only call CloseHiddenBuffers()
function! CloseHiddenBuffers()
  " figure out which buffers are visible in any tab
  let visible = {}
  for t in range(1, tabpagenr('$'))
    for b in tabpagebuflist(t)
      let visible[b] = 1
    endfor
  endfor
  " close any buffer that are loaded and not visible
  let l:tally = 0
  for b in range(1, bufnr('$'))
    if bufloaded(b) && !has_key(visible, b)
      let l:tally += 1
      exe 'bw ' . b
    endif
  endfor
  echon "Deleted " . l:tally . " buffers"
endfun

" Set tabstop, softtabstop and shiftwidth to the same value {{{2
" From http://vimcasts.org/episodes/tabs-and-spaces/
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction
 
function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    end
  finally
    echohl None
  endtry
endfunction

" Strip trailing whitespaces  {{{2
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
nmap _= :call Preserve("normal gg=G")<CR>
" Swap words in a single substitution command {{{2
" http://stackoverflow.com/questions/765894/can-i-substitute-multiple-items-in-a-single-regular-expression-in-vim-or-perl/766093#766093
function! Refactor(dict) range
  execute a:firstline . ',' . a:lastline .  's/\C\<\%(' . join(keys(a:dict),'\|'). '\)\>/\='.string(a:dict).'[submatch(0)]/ge'
endfunction
command! -range=% -nargs=1 Refactor :<line1>,<line2>call Refactor(<args>)

" Running :Refactor {'quick':'slow', 'lazy':'energetic'}  will change the following text:
"    The quick brown fox ran quickly next to the lazy brook.
"into:
"    The slow brown fox ran slowly next to the energetic brook.

" TODO: create a :Swap command, which turns:
"    :Swap(portrait,landscape)
" into
"    :Refactor {'portrait':'landscape', 'landscape':'portrait'}

" Status line {{{1
" Good article on setting a statusline:
"   http://got-ravings.blogspot.com/2008/08/vim-pr0n-making-statuslines-that-own.html
" Always show the status line (even if no split windows)
"set laststatus=2
" Mappings for a recovering TextMate user {{{1
" Indentation {{{2
"nmap <A-[> <<
"nmap <A-]> >>
"vmap <A-[> <gv
"vmap <A-]> >gv


" duplicate selection {{{2
"vmap <s-c-d> :copy'> <cr>v`[o
"nmap <s-c-d> :copy .<cr>
" move selection {{{2
  " move current line down/up
  map <c-down> ]e
  map <C-Up> [e
  " Move visually selected lines down/up
  vmap <C-Down> ]egv
  vmap <C-Up> [egv
" Move visual selection back/forwards
set ww+=<,>
vmap <C-Left> x<Left>P`[v`]
vmap <C-Right> x<Right>P`[v`]
" Configure plugins {{{1
" Gundo.vim {{{2
map <Leader>u :GundoToggle<CR>

" TextObject customizations {{{2
" Entire text object {{{3
" Map text-object for entire buffer to `ia` and `aa`.
let g:textobj_entire_no_default_key_mappings = 1
xmap aa  <Plug>(textobj-entire-a)
omap aa  <Plug>(textobj-entire-a)
xmap ia  <Plug>(textobj-entire-i)
omap ia  <Plug>(textobj-entire-i)
" }}}
" Space.vim {{{2
let g:space_disable_select_mode=1
let g:space_no_search = 1


" EasyMotion {{{2
let g:EasyMotion_leader_key = ',,'

" Vim wiki {{{2
let g:vimwiki_menu=''
" NERDcommenter {{{2
let g:NERDMenuMode=0
"  Modelines: {{{1
" vim: nowrap fdm=marker
" }}}
