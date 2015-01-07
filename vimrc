runtime! debian.vim
filetype plugin on

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

syntax on

set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules according to the
" detected filetype. Per default Debian Vim only load filetype specific
" plugins.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set ruler                           " show line and column number
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes) in terminals
set number

" --------------------------------------------------------------------------------
" configure editor with tabs and nice stuff...
" --------------------------------------------------------------------------------
set expandtab           " enter spaces when tab is pressed
set textwidth=77       " break lines when line length increases
set tabstop=2           " use 2 spaces to represent tab
set softtabstop=2
set shiftwidth=2        " number of spaces to use for auto indent
set nowrap

" make backspaces more powerfull
set backspace=indent,eol,start

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to alway generate a file-name.
" http://tex.stackexchange.com/questions/32451/set-up-vim-with-latex-suite-to-use-latexmk#32759
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_pdf = 'latexmk -pdf -f $*'

"set t_Co=256
"colorscheme zenburn
"colorscheme zellner

" Toggle line numbers and fold column for easy copying:
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

" From:
" http://dancingpenguinsoflight.com/2009/02/python-and-vim-make-your-own-ide/
" autocmd FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,(

" From:
" http://dancingpenguinsoflight.com/2009/02/code-navigation-completion-snippets-in-vim/
" Taglist variables
" Display function name in status bar:
" let g:ctags_statusline=1
" Automatically start script
" let generate_tags=1
" Displays taglist results in a vertical window:
" let Tlist_Use_Horiz_Window=0
" Shorter commands to toggle Taglist display
" nnoremap TT :TlistToggle<CR>
" map <F4> :TlistToggle<CR>
" Various Taglist diplay config:
" let Tlist_Use_Right_Window = 1
" let Tlist_Compact_Format = 1
" let Tlist_Exit_OnlyWindow = 1
" let Tlist_GainFocus_On_ToggleOpen = 1
" let Tlist_File_Fold_Auto_Close = 1

" From: http://www.vim.org/scripts/script.php?script_id=850
"let g:pydiction_location = '~/.vim/ftplugin/pydiction/complete-dict'

" Resaltar resultados de busquedas
set hlsearch
set novb

" Remove the annoying beep
set visualbell

" Fix a problem with the é
imap <buffer> <leader>it <Plug>Tex_InsertItemOnThisLine

" Move to the next line in long wrapped lines
map j gj
map k gk

" Load modeline
set modeline
set modelines=1

" To work with scanning team
"set wrap
"set linebreak
"set nolist  " list disables linebreak
"set textwidth=0
"set wrapmargin=0
