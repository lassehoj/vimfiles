filetype off
" setup pathogen
call pathogen#runtime_append_all_bundles() 

filetype indent on

" Global options
set autochdir
set autoindent
set autoread
set cursorline
set encoding=utf-8 
set fileencoding=utf-8
set hlsearch
set ignorecase
set incsearch
set matchtime=10
set nocompatible
set noexpandtab
set number
set scrolloff=5
set showmatch
set smartcase
set sw=4
set ts=4

" change into the working dir of the file upon entering a buffer
" autocmd BufEnter * lcd %:p:h

" you'll figure this one out yourself
colorscheme desert

" nicer statusline
set laststatus=2
set statusline=%{fugitive#statusline()}[%f]%m%r%h%w[%{&ff}]%y%=[%l/%L][%v]

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
map <silent> <S-F8> :Explore<CR>
 
" Tex options and tweaks.
:au FileType tex set formatoptions+=t
:au FileType tex set formatprg=par\ -w80
:au FileType tex set textwidth=80
:au FileType tex iab aling align


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
:au BufNewFile,BufRead *.sablecc		set syntax=sablecc
:au BufNewFile,BufRead *.aj				set syntax=aspectj
:au BufNewFile,BufRead *.peep				set syntax=peepholes

:au BufNewFile,BufRead *.hs				set expandtab
:au BufWinLeave *.hs	set noexpandtab 

:au BufNewFile,BufRead *.j				set syntax=jasmin

" tab all windows instead of just 10
tab all


set lazyredraw			" don't redraw while running macros - much faster
