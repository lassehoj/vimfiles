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
set incsearch
set hlsearch
set showmatch
set nocp 
set autoread
set encoding=utf-8
set autoindent

" change into the working dir of the file upon entering a buffer
autocmd BufEnter * lcd %:p:h

" Always make vim the active window on open.
augroup AutoForeground
 au!
 au BufReadPost * :call foreground()
augroup END

colorscheme desert


" Key re-maps
map <c-l> :tabnext<enter>
map <c-h> :tabprevious<enter>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>

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
:au FileType tex set iskeyword+=:

"syntax enable
au BufNewFile,BufRead *.sablecc 		runtime ~/.vim/syntax/sablecc.vim
au BufNewFile,BufRead *.aj		 		runtime ~/.vim/syntax/aspectj.vim
