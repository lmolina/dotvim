lua require('init')

"Disabled durin nvim migration
" set the runtime path to include Vundle and initialize
"set rtp+=~/.config/nvim/bundle/Vundle.vim
"call vundle#begin()

" let Vundle manage Vundle, required
"Plugin 'VundleVim/Vundle.vim'

"Plugin 'lervag/vimtex'

" For Latex synctex with Evince
"Plugin 'peterbjorgensen/sved'

"Plugin 'kana/vim-operator-user'

" Seveal key maps
"Plugin 'tpope/vim-unimpaired'

" Basical vim configurations
"Plugin 'tpope/vim-sensible'

" Interact with git inside vim
"Plugin 'tpope/vim-fugitive'

" View git changes inside vim
"Plugin 'airblade/vim-gitgutter'

"Plugin 'bling/vim-airline'

"Plugin 'altercation/vim-colors-solarized'
"Plugin 'vim-latex/vim-latex'

" File browser
"Plugin 'scrooloose/nerdtree'
" ... with ctrl+p + fussy search
"Plugin 'kien/ctrlp.vim'

" Better python indentation
"Plugin 'vim-scripts/indentpython.vim'

" Better folding
"Plugin 'tmhedberg/SimpylFold'

" Highlight and remove eol whitespace
"Plugin 'bitc/vim-bad-whitespace'

" Syntax check and Highlighting
"Plugin 'scrooloose/syntastic'

" Python check!
"Plugin 'nvie/vim-flake8'

" Autocompletion
"Plugin 'Valloric/YouCompleteMe'

" Taskwarrior interface
"Plugin 'lmolina/vim-taskwarrior'

"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'

" Align lines around a pattern, e.g., aling columns in a table
"Plugin 'godlygeek/tabular'

" A markdown plugin for vim
"Plugin 'plasticboy/vim-markdown'

" All of your Plugins must be added before the following line
"call vundle#end()            " required
filetype plugin indent on    " required

set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching

set number
set relativenumber

" Toggle line numbers and fold column for easy copying:
"nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

" --------------------------------------------------------------------------------
" configure editor with tabs and nice stuff...
" --------------------------------------------------------------------------------
set expandtab           " enter spaces when tab is pressed
set textwidth=78        " break lines when line length increases
set tabstop=2           " use 2 spaces to represent tab
set softtabstop=2
set shiftwidth=2        " number of spaces to use for auto indent
set nowrap
set colorcolumn=+0      " Higlight a vertical line at textwidth+0
"highlight ColorColumn ctermbg=lightgrey guibg=lightgrey

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Latex Suite specific configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to alway generate a file-name.
" http://tex.stackexchange.com/questions/32451/set-up-vim-with-latex-suite-to-use-latexmk#32759
"set grepprg=grep\ -nH\ $*
"let g:tex_flavor='latex'
"let g:Tex_DefaultTargetFormat = 'pdf'
"let g:Tex_CompileRule_pdf = 'latexmk -pdf -f $*'

"" While pressing F7 promp the following commands
"let g:Tex_PromptedCommands = 'textit,textbf,url,gls,num,SI'

"" Fix a problem with the é in vim-latexsuite
"imap <buffer> <leader>it <Plug>Tex_InsertItemOnThisLine


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"set t_Co=256
set background=dark
"set background=light
"colorscheme solarized

"colorscheme zenburn
"colorscheme zellner

" Remove the annoying beep
set visualbell

" Use j and k to move arround long wrapped lines
map j gj
map k gk

" Load modeline
"set modeline
"set modelines=1

" To work with scanning team
"set wrap
"set linebreak
"set nolist  " list disables linebreak
"set textwidth=0
"set wrapmargin=0

" ctags, taglist
"let Tlist_Ctags_Cmd = "/usr/bin/ctags"
"let Tlist_WinWidth = 50
"map <F4> :TlistToggle<cr>
"map <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Set the number of lines above the cursor
set scrolloff=2

" Set the number of columns arrownd the cursor
set sidescrolloff=2

" From http://vim.wikia.com/wiki/A_better_Vimdiff_Git_mergetool
" Disable one diff window during a three-way diff allowing you to cut out the
" noise of a three-way diff and focus on just the changes between two versions
" at a time. Inspired by Steve Losh's Splice
function! DiffToggle(window)
  " Save the cursor position and turn on diff for all windows
  let l:save_cursor = getpos('.')
  windo :diffthis
  " Turn off diff for the specified window (but keep scrollbind) and move
  " the cursor to the left-most diff window
  exe a:window . "wincmd w"
  diffoff
  set scrollbind
  set cursorbind
  exe a:window . "wincmd " . (a:window == 1 ? "l" : "h")
  " Update the diff and restore the cursor position
  diffupdate
  call setpos('.', l:save_cursor)
endfunction
" Toggle diff view on the left, center, or right windows
nmap <silent> <leader>dl :call DiffToggle(1)<cr>
nmap <silent> <leader>dc :call DiffToggle(2)<cr>
nmap <silent> <leader>dr :call DiffToggle(3)<cr>

" ------------------------------------------
" UI tweaks 

" Split new window below!
set splitbelow

" Split new windows on the right
set splitright

" Use <C-JKLH> to move between windows
"nnoremap <C-J> <C-W><C-J> "C-J is remapped by imaps (installed by latex-vim)
"                          "to jump to the next <++>. So better to deactivate
"                          "here to keep latex-vim happy :)
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>

"Docstring for folded code
let g:SimpylFold_docstring_preview=1

" ------------------------------------------
" ------------------------------------------
" Python IDE :)
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
"let g:syntastic_python_python_exec = '/usr/bin/env python3'
let g:syntastic_rst_checkers=['sphinx']

" Activate / deactivate syntastyc
nnoremap <F3> :SyntasticToggleMode<CR>

"au BufNewFile,BufRead *.py
      "\ set tabstop=4
      "\ set softtabstop=4
      "\ set shiftwidth=4
      "\ set textwidth=70
      "\ set expandtab
      "\ set fileformat=unix
      "\ set colorcolumn=-3,-2,-1,-0
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
" ------------------------------------------
" ------------------------------------------

" Activate and deactivate paste mode
nnoremap <F2> :set nopaste!<CR>

" Copy and paste compatible with Windows
set clipboard=unnamedplus

" Snippets configuration
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" YouCompleteMe
let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
"let g:ycm_global_ycm_extra_conf = '~/.ycm_global_extra_conf.py'
let g:ycm_global_ycm_extra_conf = '~/ycm_global_extra_conf.py'

" -----------------------
"  vimtex configuration
"let g:vimtex_view_method="zathura"
" -----------------------

"nmap <F4> :call SVED_Sync()<CR>

"----------------
"  Task Warrioir
"----------------

let g:task_rc_override = 'rc.defaultwidth=0'


" --------------
" Set default spelllang to en_us to common textfiles
" --------------

if has("autocmd")
    autocmd FileType markdown set spell spelllang=en_us
    autocmd FileType tex set spell spelllang=en_us
    autocmd FileType latex set spell spelllang=en_us
    autocmd FileType rst set spell spelllang=en_us
endif

if !exists('g:lasttab')
    let g:lasttab = 1
endif
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Use Okular in vimtex as PDF viewer
" https://github.com/lervag/vimtex/blob/1782e479a0c6a716af3a92d5ed85b65ecfad3dc0/doc/vimtex.txt
let g:vimtex_view_general_viewer = 'evince'
"let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
"let g:vimtex_view_general_options_latexmk = '--unique'

" This requires vim-gui-common. In Debian 11 vim-nox is compiled without the
" +clientserver flag, that is required by synctex to work
if empty(v:servername) && exists('*remote_startserver')
	call remote_startserver('VIM')
endif
