filetype off
" setup pathogen
" call pathogen#runtime_append_all_bundles() 

filetype indent on

" Global options
set number                      "nu:    numbers lines
set tabstop=4               	"ts:    number of spaces that a tab counts for
set shiftwidth=4                "sw:    number of spaces to use for autoindent
set noexpandtab
set cursorline					"		adds a line all the way accross the window
set ai 							"ai:	auto indent
set encoding=utf-8 
set fileencoding=utf-8
set nocompatible                "cp:    turns off strct vi compatibility
set scrolloff=5                 "so:    places a line between the current line and the screen edge
set showmatch                   "sm:    flashes matching brackets or parentheses
set matchtime=10				"		how many tenths of a second to blink matching brackets for
set autochdir					"		Change to the directory of the current file
set ignorecase                  "ic:    ignores case when pattern matching
set incsearch                   "is:    automatically begins searching as you type
set hlsearch                    "hls:   highlights search results
set showmode                    "smd:   shows current vi mode in lower left
set showcmd                     "sc:    shows typed commands
set cmdheight=2                 "ch:    make a little more room for error messages
set sidescroll=2                "ss:    only scroll horizontally little by little
set sidescrolloff=2             "siso:  places a couple columns between the current column and the screen edge
set smartcase                   "scs:   ignores ignorecase when pattern contains uppercase characters
set ttyfast                     "tf:    improves redrawing for newer computers



" you'll figure this one out yourself
colorscheme desert

" nicer statusline
set laststatus=2                "ls:    makes the status bar always visible
" set statusline=%{fugitive#statusline()}[%f]%m%r%h%w[%{&ff}]%y%=[%l/%L][%v]

" move visually across lines - not actual lines
nnoremap <Up> gk
nnoremap <Down> gj
syntax on                       "syn:   syntax highlighting


set nojoinspaces                "nojs:  prevents inserting two spaces after punctuation on a join (it's not 1990 anymore)
set lazyredraw                  "lz:    will not redraw the screen while running macros (goes faster)
set pastetoggle=<F5>            "pt:    useful so auto-indenting doesn't mess up code when pasting

" use w!! to save a file with superuser rights.
cmap w!! %!sudo tee > /dev/null %

"Quickly open the file explorer in the current working dir.
map <silent> <C-E>   :Vexplore<CR>
map <silent> <C-F> :sp +Explore<CR>

" Use ctrl-n to unhighlight search results in normal mode:
nmap <silent> <C-N> :silent noh<CR>

if &diff
"I'm only interested in diff colours
syntax off
endif

" Remember last position in file
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal g`\"" |
\ endif

" Latex files no longer than 80 char
:au BufWinEnter *tex let w:m2=matchadd('Search', '\%>80v.\+', -1)

filetype plugin on     " Enable filetype detection

autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType php let php_sql_query=1
autocmd FileType php let php_htmlInStrings=1
autocmd FileType php DoMatchParen
autocmd FileType php hi MatchParen ctermbg=white guibg=yellow

"I hate noise
set visualbell 

set mouse=a
set mousemodel=extend

" invoke latex-suite when you open a .tex file
filetype plugin on

" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:


vmap gl :<C-U>!svn blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>


" TYPO3 abbreviations
ab t3d t3lib_div::debug(

