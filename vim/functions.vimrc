"====
" Functions.. 
"====

function! IPhpInsertUse()
        call PhpInsertUse()
        call feedkeys('a',  'n')
endfunction

function! IPhpExpandClass()
        call PhpExpandClass()
        call feedkeys('a', 'n')
endfunction

function! ToggleLineAim()
    :set cursorline!
endfunction

function! ToggleAim()
    :set cursorcolumn! cursorline!
endfunction

function! ToggleNumbers()
    :set nu! relativenumber!
endfunction

function! ToggleFolding()
    :if &foldcolumn ==# 0 | set foldcolumn=1 foldmethod=indent | else | set foldcolumn=0 foldmethod=manual | endif
endfunction

function! ToggleAll()
    :call ToggleNumbers()
    :GitGutterBufferToggle
endfunction
