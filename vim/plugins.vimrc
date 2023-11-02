"====
" Plugins plugins plugins..
"====

call plug#begin()
  " Plug 'vim-autoformat/vim-autoformat'
  
  Plug 'mhinz/vim-startify'
  Plug 'vimwiki/vimwiki'
  Plug 'tobyS/vmustache'
  Plug 'tobyS/pdv'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'Raimondi/delimitMate'
  Plug 'mattn/emmet-vim'

  Plug 'preservim/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'

  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'

  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  Plug 'jwalton512/vim-blade'
  Plug 'ryanoasis/vim-devicons'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

  Plug 'zivyangll/git-blame.vim'

  Plug 'tpope/vim-fugitive'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'vim-syntastic/syntastic'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'stephpy/vim-php-cs-fixer'
  Plug 'arnaud-lb/vim-php-namespace'
  Plug 'isruslan/vim-es6'
  Plug 'tpope/vim-commentary'
  Plug 'moll/vim-node'
  "Plug 'epilande/vim-react-snippets'
  "Plug 'maxmellon/vim-jsx-pretty'
  
  " Plug 'mxw/vim-jsx'
  " Plug 'maxmellon/vim-jsx-pretty'
  Plug 'pangloss/vim-javascript'

  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'posva/vim-vue'
  Plug 'adoy/vim-php-refactoring-toolbox'
  Plug 'voldikss/vim-floaterm'
  Plug 'mtdl9/vim-log-highlighting'

  "Plug 'arcticicestudio/nord-vim'
  "Plug 'srcery-colors/srcery-vim' 
  
  Plug 'w0ng/vim-hybrid' 
  Plug 'francoiscabrol/ranger.vim'
  Plug 'rbgrouleff/bclose.vim'
  " Plug 'github/copilot.vim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'preservim/tagbar'

  Plug 'gelguy/wilder.nvim'
  Plug 'akinsho/toggleterm.nvim'

call plug#end()


" 'gelguy/wilder.nvim'
call wilder#setup({'modes': [':', '/', '?']})




" -------------------------
" === NERDTree especificos
" -------------------------

let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.git', '\~$', '\.swp']

let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

" Padding between icon and file/folder name
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>nf :NERDTreeFind<CR>zz

" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

let NERDTreeHighlightCursorline = 0




" -------------------------
" === Airline especificos
" -------------------------
        let g:airline_powerline_fonts = 1 	"autorizando powerlinefonts
        let g:airline#extensions#tabline#enabled = 1 "Criando lista de buffers no topo

        " Mostrar só o nome do arquivo
        let g:airline#extensions#tabline#fnamemod = ':t'
        if !exists('g:airline_symbols')
          let g:airline_symbols = {}
        endif
        let g:airline_symbols.space = "\ua0"
        "let g:airline_theme='nord'
        let g:airline_theme='minimalist'




" -------------------------
" --- VIMWIKI - Listas listas listas..
" -------------------------
        " let wiki_1 = {}
        " let wiki_1.path = '~/vimwiki/'

        " let wiki_2 = {}
        " let wiki_2.path = '~/vimwiki_scaffold/'

        " let g:vimwiki_list = [wiki_1, wiki_2]

        let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
        let g:instant_markdown_autostart = 0


" -------------------------
" === Ultisnips especificos
" -------------------------
        " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
        let g:UltiSnipsExpandTrigger="<tab>"

        " If you want :UltiSnipsEdit to split your window.
        let g:UltiSnipsEditSplit="vertical"

" -------------------------
" === Emmet especificos
" -------------------------
        let g:user_emmet_mode='i'  " Emmet vai funcionar em insert mode (opcoes: 'niv')

        "Remapeando Insert MODE CTRLE para dar CTRLY, (trigger padrao do emmet)
        imap <C-e> <C-y>,


" -------------------------
" === Syntastic especificos (https://github.com/vim-syntastic/syntastic)
" -------------------------
        set statusline+=%#warningmsg#
        set statusline+=%{SyntasticStatuslineFlag()}
        set statusline+=%*

        let g:syntastic_always_populate_loc_list = 1
        let g:syntastic_auto_loc_list = 1
        let g:syntastic_check_on_open = 1
        let g:syntastic_check_on_wq = 0
        let g:syntastic_javascript_checkers = ['eslint']
        let gsyntastic_javascript_eslint_exe = 'npx eslint %'


        "Desativndo sintax checker para rodar somente quando precisar
        let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['php'],'passive_filetypes': [] }
        nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>
        nnoremap <leader>sc  :SyntasticCheck<CR>

        " Especificando os checkers que rodaram em arquivos .php (é necessario ter os checkers instalados)
        let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd', 'phplint']

" -------------------------
" === Tagbar (https://github.com/preservim/tagbar)
" -------------------------
        nmap <leader>tb :TagbarToggle<CR>


" -------------------------
"" === PDV (https://github.com/tobyS/pdv)
" -------------------------
        let g:pdv_template_dir = $HOME . "/.vim/plugged/pdv/templates_snip"
        nnoremap <leader>doc :call pdv#DocumentCurrentLine()<CR>v/\*\/<cr>:s/${.*://<cr>V?\*\*<cr>:s/} */ /<cr>V?\*\*<cr>:s/${.* //<cr>

" -------------------------
" === vim-php-namespace (https://github.com/arnaud-lb/vim-php-namespace)
" -------------------------

        "Apos inserir sort por tamanho
        let g:php_namespace_sort = "'{,'}-1!awk '{print length, $0}' | sort -n -s | cut -d' ' -f2-"
        " Sort automatico apos insercao
        let g:php_namespace_sort_after_insert = 1

        " Inserindo use statements das classes com <leader>use
        autocmd FileType php inoremap <Leader>use <Esc>:call IPhpInsertUse()<CR>
        autocmd FileType php noremap <Leader>use :call PhpInsertUse()<CR>

        " Expandindo class name com <leader>exp
        autocmd FileType php inoremap <Leader>exp <Esc>:call IPhpExpandClass()<CR>
        autocmd FileType php noremap <Leader>exp :call PhpExpandClass()<CR>

        " Arrumando use statements por tamanho com <leader>sr
        autocmd FileType php inoremap <Leader>sr <Esc>:call PhpSortUse()<CR>
        autocmd FileType php noremap <Leader>sr :call PhpSortUse()<CR>


" -------------------------
" === treesitter 
" -------------------------

:lua << EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = "all",

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing (for "all")
  ignore_install = "",

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  rainbow = {
        enable=true,
        extended_mode=true
  },
}
EOF

