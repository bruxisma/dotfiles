" Modified version of pyte.vim

set background=light

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "kadesh"


" Vim >= 7.0 specific colors
if version >= 700
  hi CursorLine               guibg=#f6f6f6
  hi CursorColumn             guibg=#eaeaea
  hi MatchParen guifg=#ffffff guibg=#80a090 gui=bold
  hi Pmenu      guifg=#ffffff guibg=#808080
  hi PmenSel    guifg=#000000 guibg=#f0f0f0
endif

" General Colors
hi Cursor       guifg=#000000 guibg=#b0b4b8 gui=none
hi Normal       guifg=#404850 guibg=#f0f0f0 gui=none
hi NonText      guifg=#c0c0c0 guibg=#e0e0e0 gui=none
hi LineNr       guifg=#ffffff guibg=#c0d0e0 gui=none
hi StatusLine   guifg=#ffffff guibg=#8090a0 gui=italic
hi StatusLineNC guifg=#506070 guibg=#a0b0c0 gui=none
hi VertSplit    guifg=#a0b0c0 guibg=#a0b0c0 gui=none
hi Folded       guifg=#a0a0a0 guibg=#e8e8e8 gui=none
hi Title        guifg=#202020               gui=bold
hi Visual       guifg=#202020 guibg=#a0b0c0 gui=none
hi SpecialKey   guifg=#d0b0b0 guibg=#f0f0f0 gui=none

" Syntax Highlighting
hi Comment      guifg=#a0b0c0               gui=italic
hi Todo         guifg=#a00000 guibg=#BAD579 gui=italic,bold
hi Constant     guifg=#a07040               gui=none
hi String       guifg=#4070a0               gui=italic
hi Identifier   guifg=#5b3674               gui=none
hi Function     guifg=#06287e               gui=none
hi Type         guifg=#e5a00d               gui=none
hi Statement    guifg=#6694b6               gui=bold
hi Keyword      guifg=#6694b6               gui=none
hi PreProc      guifg=#1060a0               gui=none
hi Number       guifg=#40a070               gui=none
hi Special      guifg=#9b96c9               gui=bold
