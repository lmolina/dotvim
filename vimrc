runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

syntax on
filetype plugin indent on

let mapleader = ","

set background=dark

set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching

set mouse=a		" Enable mouse usage (all modes) in terminals
set number
" Toggle line numbers and fold column for easy copying:
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

" --------------------------------------------------------------------------------
" configure editor with tabs and nice stuff...
" --------------------------------------------------------------------------------
set expandtab           " enter spaces when tab is pressed
set textwidth=77       " break lines when line length increases
set tabstop=2           " use 2 spaces to represent tab
set softtabstop=2
set shiftwidth=2        " number of spaces to use for auto indent
set nowrap

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Latex Suite specific configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to alway generate a file-name.
" http://tex.stackexchange.com/questions/32451/set-up-vim-with-latex-suite-to-use-latexmk#32759
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_pdf = 'latexmk -pdf -f $*'

" While pressing F7 promp the following commands
let g:Tex_PromptedCommands = 'textit,textbf,url,gls'

" Fix a problem with the é in vim-latexsuite
imap <buffer> <leader>it <Plug>Tex_InsertItemOnThisLine


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"set t_Co=256
"colorscheme zenburn
"colorscheme zellner
colorscheme solarized

" Resaltar resultados de busquedas
set hlsearch

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
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
"let Tlist_WinWidth = 50
map <F4> :TlistToggle<cr>
map <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Set the number of lines above the cursor
set scrolloff=2

" Set the number of columns arrownd the cursor
set sidescrolloff=2
