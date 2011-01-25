filetype off
" setup pathogen
call pathogen#runtime_append_all_bundles() 

filetype indent on

" Global options
set number
set ts=4
set sw=4
set noexpandtab
set cursorline
set ai
set encoding=utf-8 
set fileencoding=utf-8
set nocompatible
set scrolloff=5
set showmatch
set matchtime=10
set autochdir
set ignorecase
set incsearch
set hlsearch
set showmatch
set nocp 
set autoread
set encoding=utf-8
set autoindent
set smartcase

" change into the working dir of the file upon entering a buffer
" autocmd BufEnter * lcd %:p:h

" you'll figure this one out yourself
colorscheme desert

" nicer statusline
set statusline=%{fugitive#statusline()}%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
set laststatus=2

"
" Key re-maps
map <c-l> :tabnext<enter>
map <c-h> :tabprevious<enter>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>

" move visually across lines - not actual lines
nnoremap j gj
nnoremap k gk

map <F1> <Esc>
imap <F1> <Esc>
cmap <F1> <Esc>

map H ^
map L $

" use w!! to save a file with superuser rights.
cmap w!! %!sudo tee > /dev/null %

"Quickly open the file explorer in the current working dir.
map <silent> <F8>   :Vexplore<CR>
map <silent> <S-F8> :sp +Vexplore<CR>

" miniBufExplorer options
let g:miniBufExplMapWindowNavVim = 0
let g:miniBufExplMapWindowNavArrows = 0
let g:miniBufExplMapCTabSwitchBufs = 0
let g:miniBufExplModSelTarget = 1
 
" Tex options and tweaks.
:au FileType tex set formatoptions+=t
:au FileType tex set formatprg=par\ -w80
:au FileType tex set textwidth=80
:au FileType tex iab aling align
":au BufWinEnter *tex colorscheme evening
":au BufWinLeave *tex colorscheme desert
" autocmd  FocusGained  	*.tex   	:colorscheme evening
" autocmd  FocusLost  	*.tex   	:colorscheme desert


" visual warning that your lines are too long in tex
:au BufWinEnter *tex let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)

" invoke latex-suite when you open a .tex file
filetype plugin on

" grep will sometimes skip displaying the file name if you
" search in a single file. This will confuse latex-suite.
" set your grep program to always generate a file-name.
set grepprg=grep\ -nH\ $*


let g:tex_flavor='latex'

" latex-suite specific lines
" if you write your label's as \label{fig:something}, then if you
" type in \ref{fik: and press <C-n> you will automatically cycle through
" all the figure labels.
:au FileType tex set iskeyword+=:


" obscure syntax enable
:au BufNewFile,BufRead *.sablecc 		set syntax=sablecc
:au BufNewFile,BufRead *.aj		 		set syntax=aspectj
:au BufNewFile,BufRead *.peep		 		set syntax=peepholes

:au BufNewFile,BufRead *.hs		 		set expandtab
:au BufWinLeave *.hs	set noexpandtab 

:au BufNewFile,BufRead *.j		 		set syntax=jasmin

" tab all windows instead of just 10
tab all
