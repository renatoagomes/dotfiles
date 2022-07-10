-- Shorten function name 
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", ",", "<Nop>", opts)
vim.g.mapleader = ","

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Sessions Workflow (<F4> when finishing, <F5> when restarting)
vim.cmd("let g:session_dir = '~/dotfiles/vim/vim-sessions'")
vim.cmd("exec 'nnoremap <F4> :mks! ' . g:session_dir . '/'")
vim.cmd("exec 'nnoremap <F5> :so ' . g:session_dir . '/'")

-- CTRLC / CTRLV
vim.cmd("let &clipboard = has('unnamedplus') ? 'unnamedplus' : 'unnamed'")
vim.cmd('vm <c-x> "+x')
vim.cmd('vm <c-c> "+y')
vim.cmd('cno <c-v> <c-r>+')
vim.cmd("exe 'ino <script> <C-V>' paste#paste_cmd['i']")


-- " git mappings - 'vim-fugitive'
vim.cmd("nmap <leader>gst :Git<CR>")
vim.cmd("nmap <leader>gm :Git mergetool<CR>")
vim.cmd("nmap <leader>gad :Gwrite<CR>")
vim.cmd("nmap <leader>gcm :Git commit<CR>")
vim.cmd("nmap <leader>gbl :Gblame<CR>")
vim.cmd("nmap <F11> :Git diff<CR>")
vim.cmd("nmap <F12> :Git blame<CR>")



-- Quick edit files (dotfiles, i3, zsh, vim, snippets)
keymap("n", "<leader>dot", ":e ~/dotfiles/README.md<cr>", opts)
keymap('n', '<leader>i3', ':e ~/dotfiles/i3/config<cr>', opts)
keymap('n', '<leader>zsh', ':e ~/dotfiles/zsh/zshrc<cr>', opts)
-- keymap('n', '<leader>es', ':e ~/dotfiles/vim/UltiSnips/', opts)
-- keymap('n', '<leader>ev', ':e ~/dotfiles/vim/vimrc<cr>', opts)
-- keymap('n', '<leader>evp', ':e ~/dotfiles/vim/plugins.vimrc<cr>', opts)
-- keymap('n', '<leader>evs', ':e ~/dotfiles/vim/settings.vimrc<cr>', opts)
-- keymap('n', '<leader>evv', ':e ~/dotfiles/vim/visual.vimrc<cr>', opts)
-- keymap('n', '<leader>evm', ':e ~/dotfiles/vim/mappings.vimrc<cr>', opts)
-- keymap('n', '<leader>evw', ':e ~/dotfiles/vim/workflow.vimrc<cr>', opts)

-- seed file (para recarregar as confs do vim sem ter que dar restart)
-- keymay("n", "<leader>ss, ":source ~/dotfiles/nvim/init.lua<CR>", opts)


-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<Space>", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<C-q>", "<cmd>Bdelete!<CR>", opts)
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Save current buffer 
keymap("n", "<C-s>", ":w<CR>", opts)
keymap("i", "<C-s>", ":w<CR>", opts)

-- Toggle to previous buffer 
keymap("n", "<Tab>", ":b#<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Changing foldmethod 
keymap("n", "<leader>cff", ":set foldmethod=", opts)



-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- NvimTree
keymap("n", "<leader>n", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>nf", ":NvimTreeFindFileToggle<CR>", opts)

-- Telescope
keymap("n", "<C-p>", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- Git
--keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')

-- DAP
-- keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
-- keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
-- keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
-- keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
-- keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
-- keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
-- keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
-- keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
-- keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)



-- " -------------------------
-- " --- VIMWIKI - Listas listas listas..
-- " -------------------------
-- " let wiki_1 = {}
-- " let wiki_1.path = '~/vimwiki/'

-- " let wiki_2 = {}
-- " let wiki_2.path = '~/vimwiki_scaffold/'

-- " let g:vimwiki_list = [wiki_1, wiki_2]

vim.cmd("let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]")
vim.cmd("let g:instant_markdown_autostart = 0")
vim.cmd("nmap <F1> :VimwikiIndex<cr>")


-- Float terminal 
keymap("n", "<leader><leader>", ":FloatermToggle<cr>", opts)
vim.cmd("tnoremap <Esc><Esc> <C-\\><C-n>")
vim.cmd("nnoremap   <silent>   <F6>    :FloatermNew<CR>")
vim.cmd("tnoremap   <silent>   <F6>    <C-\\><C-n>:FloatermNew<CR>")
vim.cmd("nnoremap   <silent>   <F7>    :FloatermPrev<CR>")
vim.cmd("tnoremap   <silent>   <F7>    <C-\\><C-n>:FloatermPrev<CR>")
vim.cmd("nnoremap   <silent>   <F8>    :FloatermNext<CR>")
vim.cmd("tnoremap   <silent>   <F8>    <C-\\><C-n>:FloatermNext<CR>")

-- "" Float terminal configs
vim.cmd("let g:floaterm_width=0.8")
vim.cmd("let g:floaterm_height=0.8")

vim.cmd("let g:terminal_color_4 = '#ff0000'")
vim.cmd("let g:terminal_color_5 = 'green'")
vim.cmd("let g:floaterm_autoinsert = v:true")
vim.cmd("let g:floaterm_title = '$ $1/$2'")
vim.cmd("hi Floaterm guibg=black")
vim.cmd("hi FloatermBorder guibg=orange guifg=cyan")


-- " Carregando linha com CTRL + J ou K
-- " 
vim.cmd("nnoremap <C-J> :m .+1<CR>==")
vim.cmd("nnoremap <C-K> :m .-2<CR>==")
vim.cmd("inoremap <C-J> <Esc>:m .+1<CR>==gi")
vim.cmd("inoremap <C-K> <Esc>:m .-2<CR>==gi")
vim.cmd("vnoremap <C-J> :m '>+1<CR>gv=gv")
vim.cmd("vnoremap <C-K> :m '<-2<CR>gv=gv")



-- " -------------------------
-- " Laravel Mappings
-- " -------------------------
-- " .env do projeto atual
vim.cmd("nmap <leader>lev :e .env<cr>")
vim.cmd("nmap <leader>lrw :e routes/web.php<cr>")
vim.cmd("nmap <leader>lra :e routes/api.php<cr>")






