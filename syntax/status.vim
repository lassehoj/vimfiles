" Vim syntax file
" Language:     Juliet's todo files
" Maintainer:   Juliet Kemp 
" Last Change:  Sept 14, 2011
" Version:      1

" if exists("b:current_syntax")
	" finish
" endif

setlocal iskeyword+=:
syn case ignore 

syn region notDone			start="^0: "	end="$"
syn region rehandin			start="^1: "	end="$"
syn region rehandinDone		start="^2: "	end="$"
syn region rehandinHandedin	start="^3: "	end="$"
syn region approved			start="^4: "	end="$"

highlight notDone				ctermfg=red guifg=red
highlight rehandin				ctermfg=lightred guifg=lightred
highlight rehandinDone			ctermfg=yellow guifg=yellow
highlight rehandinHandedin		ctermfg=green guifg=green
highlight approved				ctermfg=darkgreen guifg=darkgreen

let b:current_syntax = "status"
