filetype indent on
let g:miniBufExplMapWindowNavVim = 0
let g:miniBufExplMapWindowNavArrows = 0
let g:miniBufExplMapCTabSwitchBufs = 0
let g:miniBufExplModSelTarget = 1

" remove stupid toolbars
set go-=T
set go-=m


" Always make vim the active window on open.
augroup AutoForeground
 au!
 au BufReadPost * :call foreground()
augroup END
