set number
let g:miniBufExplMapWindowNavVim = 0
let g:miniBufExplMapWindowNavArrows = 0
let g:miniBufExplMapCTabSwitchBufs = 0
let g:miniBufExplModSelTarget = 1
map H ^
map L $
colorscheme desert
set ts=4
set sw=4

set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]


" :au BufWinEnter *tex let w:m1=matchadd('Search', '\%<81v.\%>77v', -1)
:au BufWinEnter *tex let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)

" invoke latex-suite when you open a .tex file
filetype plugin on

" grep will sometimes skip displaying the file name if you
" search in a single file. This will confuse latex-suite.
" set your grep program to always generate a file-name.
set grepprg=grep\ -nH\ $*

filetype indent on

let g:tex_flavor='latex'


" latex-suite specific lines
" if you write your label's as \label{fig:something}, then if you
" type in \ref{fik: and press <C-n> you will automatically cycle through
" all the figure labels.
set iskeyword+=:

set go-=T
set go-=m
