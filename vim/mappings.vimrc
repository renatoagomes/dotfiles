"====
" Mappings.. 
"====

map <leader>cff :set foldmethod=

"Mapeando a troca de filetype para facilitar problemad com identacao de blade & html
map <leader>cft :set ft=

"seed file (para recarregar as confs do vim sem ter que dar restart)
map <leader>ss :source ~/.vimrc<CR>

"Fechando buffer atual com Ctrl q
nmap <C-q> :bdelete<CR>

"Trocando de buffers prev / next com <leader> q||w
noremap <leader>q :bp<CR>
noremap <leader>Q :bp<CR>
noremap <leader>w :bn<CR>
noremap <leader>W :bn<CR>
noremap <F2> :bp<CR>
noremap <F3> :bn<CR>

"Salvando arquivo com Ctrl s (bindando visual e insert mode tambem)
nmap <C-s> :w<CR>
vmap <C-s> <esc>:w<CR>gv
imap <C-s> <esc>:w<CR>a

"Split Management (trocar entre splits com ctrl HJKL)
nmap <C-J> <C-W><C-J>
nmap <C-H> <C-W><C-H>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>

" Carregando linha com CTRL + J ou K
" 
nnoremap <C-J> :m .+1<CR>==
nnoremap <C-K> :m .-2<CR>==
inoremap <C-J> <Esc>:m .+1<CR>==gi
inoremap <C-K> <Esc>:m .-2<CR>==gi
vnoremap <C-J> :m '>+1<CR>gv=gv
vnoremap <C-K> :m '<-2<CR>gv=gv


"Resize VSP
nmap <leader>b :vertical resize +10<cr>
nmap <leader>v :vertical resize -10<cr>


" Float terminal 
nmap <leader><leader> :FloatermToggle<cr>
nmap <leader>< :ToggleTerm<cr>
nmap <leader>> :FloatermNext<cr>
tnoremap <ESC><ESC> <C-\><C-n>

nnoremap   <silent>   <F6>    :FloatermNew<CR>
tnoremap   <silent>   <F6>    <C-\><C-n>:FloatermNew<CR>
nnoremap   <silent>   <F7>    :FloatermPrev<CR>
tnoremap   <silent>   <F7>    <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent>   <F8>    :FloatermNext<CR>
tnoremap   <silent>   <F8>    <C-\><C-n>:FloatermNext<CR>



" Make Arrowkey do something usefull, resize the viewports accordingly and
" it also forces us to use the default Vim movement keys HJKL
nnoremap <Left> :vertical resize +5<CR>
nnoremap <Right> :vertical resize -5<CR>
nnoremap <Up> :resize +5<CR>
nnoremap <Down> :resize -5<CR>

