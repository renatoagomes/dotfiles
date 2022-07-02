syntax on
filetype plugin indent on

set nocompatible                                        
set autoread                                            
set encoding=utf8
set fileencoding=utf8
set foldlevelstart=1
set backspace=indent,eol,start
set hidden
set nu
set relativenumber
set numberwidth=2
set expandtab       " use spaces instead of tabs
set autoindent      " autoindent based on line above, works most of the time
set smartindent     " smarter indent for C-like languages


" -------------------------
" === File specific identation 
" -------------------------

autocmd FileType python setlocal shiftwidth=2 softtabstop=2 
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType scss setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType vue setlocal shiftwidth=2 tabstop=2
autocmd FileType php setlocal shiftwidth=4 tabstop=4
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2


" -------------------------
" SEARCH (https://github.com/Roshanjossey/dot-files/blob/master/.vimrc#L126):
" -------------------------

set ignorecase " case insensitive search
set incsearch " live incremental searching
set showmatch " live match highlighting
set hlsearch " highlight matches
set gdefault " use the `g` flag by default.
set smartcase " If there are uppercase letters, become case-sensitive.


" wildmenu completion - https://stackoverflow.com/questions/9511253/how-to-effectively-use-vim-wildmenu
set wildmenu
set wildmode=longest:full,full
set wildignore+=*/vendor/*,*/node_modules/*,*.swp,*.zip
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*/public/*


