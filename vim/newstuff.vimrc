
let g:EditorConfig_exclude_patterns = ['fugitive://.\*']

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"" Float terminal configs
let g:floaterm_width=0.8
let g:floaterm_height=0.8

"" Disable coc warning
let g:coc_disable_startup_warning = 1

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*,!docker/*,!storage/*,!vendor/*,!node_modules/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)


let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.9 } }
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:55%' --layout reverse --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"


let g:python3_host_prog="/usr/bin/python3"

if executable('intelephense')
  augroup LspPHPIntelephense
    au!
    au User lsp_setup call lsp#register_server({
        \ 'name': 'intelephense',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'intelephense --stdio']},
        \ 'whitelist': ['php'],
        \ 'initialization_options': {'storagePath': '/tmp/intelephense'},
        \ 'workspace_config': {
        \   'intelephense': {
        \     'files': {
        \       'maxSize': 1000000,
        \       'associations': ['*.php', '*.phtml'],
        \       'exclude': [],
        \     },
        \     'completion': {
        \       'insertUseDeclaration': v:true,
        \       'fullyQualifyGlobalConstantsAndFunctions': v:false,
        \       'triggerParameterHints': v:true,
        \       'maxItems': 100,
        \     },
        \     'format': {
        \       'enable': v:true
        \     },
        \   },
        \ }
        \})
  augroup END
endif


" Copilot
"
let g:copilot_filetypes = {
 \ '*': v:false,
 \ 'php': v:true,
 \ 'javascript': v:true,
 \ 'vue': v:true,
 \ 'blade': v:true,
\ }
