"====
" Workflow settings, mappings etc.. 
"====

" sessions workflow (<F4> when finishing, <F5> when restarting)
let g:session_dir = '~/dotfiles/vim/vim-sessions'
exec 'nnoremap <F4> :mks! ' . g:session_dir . '/'
exec 'nnoremap <F5> :so ' . g:session_dir . '/'

" SWAP FILES NEVER AGAIN!! vlw @ltgouvea :+1:
set dir=$HOME/.vim_tmp/swap
if !isdirectory(&dir) | call mkdir(&dir, 'p', 0700) | endif

" CTRLC / CTRLV Like a windows
let &clipboard = has('unnamedplus') ? 'unnamedplus' : 'unnamed'
vm <c-x> "+x
vm <c-c> "+y
cno <c-v> <c-r>+
exe 'ino <script> <C-V>' paste#paste_cmd['i']

" files i want a quick way to edit (dotfiles, i3, zsh, vim, snippets)
nmap <leader>dot :e ~/dotfiles/README.md<cr>            
nmap <leader>i3 :e ~/dotfiles/i3/config<cr>
nmap <leader>zsh :e ~/dotfiles/zsh/zshrc<cr>
nmap <leader>ev :e ~/dotfiles/vim/vimrc<cr>
nmap <leader>es :e ~/dotfiles/vim/UltiSnips/

" git mappings - 'vim-fugitive'
nmap <leader>gst :Git<CR>
nmap <leader>gm :Git mergetool<CR>
nmap <leader>gad :Gwrite<CR>
nmap <leader>gcm :Git commit<CR>
nmap <leader>gbl :Gblame<CR>
nmap <F11> :Git diff<CR>
nmap <F12> :Git blame<CR>

"Limpando highlights
nnoremap <leader><space> :noh<return><esc>                           



nmap <C-P> :Files<cr>
nmap <C-P> :Files<cr>
nmap <leader>p :Buffers<cr>
nmap <leader>P :Rg<cr>

"Reload no arquivo com ,r
nmap <leader>r :e!<cr>


nnoremap + <C-a>
nnoremap - <C-x>
nnoremap -g :GitGutterToggle<CR>
nnoremap -a :exec ToggleAim()<CR>
nnoremap -f :exec ToggleFolding()<CR>
nnoremap -n :exec ToggleNumbers()<CR>
nnoremap -l :exec ToggleLineAim()<CR>
nnoremap -- :exec ToggleAll()<CR>



nmap <TAB> :b#<cr>
nmap <leader>td :e ~/vimwiki/TODO_DIARIO.md<CR>
nmap <leader>tw :e ~/vimwiki/TODO_SEMANAL.md<CR>
nmap <leader>t :e ~/vimwiki/TODO_SEMANAL.md<CR>
nmap <F1> :VimwikiIndex<cr>


" -------------------------
" Laravel Mappings
" -------------------------
" .env do projeto atual
nmap <leader>lev :e .env<cr>
nmap <leader>lrw :e routes/web.php<cr>
nmap <leader>lra :e routes/api.php<cr>




nmap <leader>F :BTags<cr>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>
