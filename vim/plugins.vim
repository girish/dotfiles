let g:showmarks_enable = 0 " disabled by default by populardemand ;)
" showmarks
hi! link ShowMarksHLl LineNr
hi! link ShowMarksHLu LineNr
hi! link ShowMarksHLo LineNr
hi! link ShowMarksHLm LineNr


" syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_quiet_messages = {'level': 'warnings'}

let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 1


" minibufexpl
let g:miniBufExplVSplit = 25
let g:miniBufExplorerMoreThanOne = 100
let g:miniBufExplUseSingleClick = 1
" ,b to display current buffers list
nmap <leader>b :MiniBufExplorer<CR>

let g:Conque_Read_Timeout = 50 " timeout for waiting for command output.
let g:Conque_TERM = 'xterm'
" ,sh shell window
nmap <Leader>sh :ConqueTermSplit zsh<cr>
map <c-c> :execute 'ConqueTermVSplit zsh -7'<CR>
let g:ConqueTerm_MyTermPosition = 'J'

" yankring
let g:yankring_replace_n_pkey = '<leader>['
let g:yankring_replace_n_nkey = '<leader>]'
" ,y to show the yankring
nmap <leader>y :YRShow<cr>


nmap <c-p> :NERDTreeToggle<cr>

" rails
" completing Rails hangs a lot
"let g:rubycomplete_rails = 1

" command-t
nmap <Leader>f :CommandT<CR>
let g:CommandTMatchWindowAtBottom=1

" Fugitive
" ,e for Ggrep
nmap <leader>g :Ggrep
"
" Ack
" ,a for Ack
nmap <leader>k :Ack

" vim-indentobject
" add Markdown to the list of indentation based languages
let g:indentobject_meaningful_indentation = ["haml", "sass", "python", "yaml", "markdown"]

let vimclojure#HighlightBuiltins =1
let vimclojure#ParenRainbow=1
let vimclojure#WantNailgun = 1
let vimclojure#NailgunClient = "/home/girish/nailgun-client/ng"


highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" only define it when not defined already.
if !exists(":Difforig")
  command Difforig vert new | set bt=nofile | r # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif


