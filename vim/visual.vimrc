"====
" Visual settings
"====


"set t_Co=256
"colorscheme atom-dark-256                                       "(https://github.com/gosukiwi/vim-atom-dark)
"colorscheme srcery                                               "(https://github.com/gosukiwi/vim-atom-dark)

"set background=dark
colorscheme hybrid

" Settando cor dos LineNumbers e do split vertical
hi LineNr guibg=bg
hi vertsplit guifg=bg

hi Folded ctermfg=DarkGrey
hi Folded ctermbg=bg

hi CocUnusedHighlight ctermbg=bg
hi CocUnusedHighlight ctermfg=LightGray

let g:terminal_color_4 = '#ff0000'
let g:terminal_color_5 = 'green'


" terminal / floaterm mappings & settings
let g:floaterm_autoinsert = v:true
let g:floaterm_title = '$ $1/$2'

hi Floaterm guibg=black
hi FloatermBorder guibg=orange guifg=cyan
