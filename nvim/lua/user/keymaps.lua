-- Shorten function name 
local keymap = vim.keymap.set

-- Silent keymap option
local opts = { silent = true }

vim.g.mapleader = ","

-- Sessions Workflow (<F4> when finishing, <F5> when restarting)
vim.cmd("let g:session_dir = '~/dotfiles/vim/vim-sessions'")
vim.cmd("exec 'nnoremap <F4> :mks! ' . g:session_dir . '/'")
vim.cmd("exec 'nnoremap <F5> :so ' . g:session_dir . '/'")

-- " git mappings - 'vim-fugitive'
vim.cmd("nmap <leader>gst :Git<CR>")
vim.cmd("nmap <F2> :Git<CR><C-w><S-h>")
vim.cmd("nmap <leader>gm :Git mergetool<CR>")
vim.cmd("nmap <leader>gad :Gwrite<CR>")
vim.cmd("nmap <leader>gcm :Git commit<CR>")
vim.cmd("nmap <leader>gbl :Gblame<CR>")
vim.cmd("nmap <F11> :Git diff<CR>")
vim.cmd("nmap <F12> :Git blame<CR>")

-- Changing foldmethod..
keymap("", "<leader>fm", ":set foldmethod=", opts)

-- Changing filetype..
keymap("", "<leader>ty", ":set ft=", opts)

-- Quick edit files (dotfiles, i3, zsh, nvim, snippets)
keymap("n", "<leader>dot", ":e ~/dotfiles/README.md<CR>", opts)
keymap('n', '<leader>i3', ':e ~/dotfiles/i3/config<CR>', opts)
keymap('n', '<leader>zsh', ':e ~/dotfiles/zsh/zshrc<CR>', opts)
keymap('n', '<leader>av', ':e ~/dotfiles/alacritty/alacritty.yml<CR>', opts)
keymap('n', '<leader>ev', ':e ~/dotfiles/nvim/init.lua<CR>', opts)
keymap('n', '<leader>evp', ':e ~/dotfiles/nvim/lua/user/plugins.lua<CR>', opts)
keymap('n', '<leader>evm', ':e ~/dotfiles/nvim/lua/user/mason.lua<CR>', opts)
keymap('n', '<leader>evk', ':e ~/dotfiles/nvim/lua/user/keymaps.lua<CR>', opts)
keymap('n', '<leader>ee', ':e ~/dotfiles/nvim/snippets/snipmate/', opts)

-- Better window navigation
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)

-- navigate buffers with L || H
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Clear highlights
keymap("n", "<Space><Space>", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<C-q>", "<cmd>Bdelete!<CR>", opts)

-- Save current buffer 
keymap("n", "<C-s>", ":w<CR>", opts)
keymap("i", "<C-s>", "<ESC>:w<CR>a", opts)

-- Toggle to previous buffer 
keymap("n", "<Tab>", ":b#<CR>", opts)

-- Reload file com <leader>r
keymap("n", "<leader>r", ":e!<cr>", opts)

-- 
keymap("i", "<F3>", "<ESC>:.!sh<CR>", opts)
keymap("n", "<F3>", "<ESC>:.!sh<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)


-- Plugins --

-- NvimTree
keymap("n", "<leader>n", ":NvimTreeFindFileToggle<CR>", opts)

-- Telescope
-- keymap("n", "<C-p>", ":Telescope find_files no_ignore=true initial_mode=insert<CR>", opts)
keymap("n", "<C-p>", ":Telescope find_files cwd=`pwd` no_ignore=true find_command=rg,--files,--with-filename <CR>", opts)

-- find_command="{'rg'},
--       '--color=never',
--       '--no-heading',
--       '--with-filename',
--       '--line-number',
--       '--column',
--       '--smart-case',

keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fo", ":Telescope oldfiles<CR>", opts)
keymap("n", "<leader>fr", ":Telescope oldfiles<CR>", opts)
keymap("n", "<leader>fc", ":Telescope git_status<CR>", opts)
keymap("n", "<leader>fg", ":Telescope git_commits<CR>", opts)

-- Comment
-- keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')

-- DAP (debugging)
--[[ keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts) ]]
--[[ keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts) ]]
--[[ keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts) ]]
--[[ keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts) ]]
--[[ keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts) ]]
--[[ keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts) ]]
--[[ keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts) ]]
--[[ keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts) ]]
--[[ keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts) ]]

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
vim.cmd("let g:user_emmet_leader_key='<C-e>'")


-- " Carregando linha com CTRL + J ou K
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
keymap("n", "<leader>lev", ":e .env<CR>", opts)
keymap("n", "<leader>lrw", ":e routes/web.php<CR>", opts)
keymap("n", "<leader>lra", ":e routes/api.php<CR>", opts)
keymap('n', '<leader>ll', ':e ./storage/logs/laravel.log<CR>', opts)

-- Wildmenu completion
vim.cmd("call wilder#setup({'modes': [':', '/', '?']})")

-- COC goto definition
-- vim.cmd("nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>")

-- PDV 
vim.cmd('let g:pdv_template_dir = $HOME . "/.vim/plugged/pdv/templates_snip"')
vim.cmd("nnoremap <leader>doc :call pdv#DocumentWithSnip()<CR>")

keymap("v", "<C-Space>", ">gv", opts)

-- gx open link in browser
keymap("n", "gx", [[:silent execute '!$BROWSER ' . shellescape(expand('<cfile>'), 1)<CR>]], opts)



