vim.g.mapleader = ','
vim.g.maplocalleader = ','

local opts = { noremap = true, silent = true }

-- Sessions Workflow (<F4> when finishing, <F5> when restarting)
vim.cmd("let g:session_dir = '~/dotfiles/vim/vim-sessions'")
vim.cmd("exec 'nnoremap <F4> :mks! ' . g:session_dir . '/'")
vim.cmd("exec 'nnoremap <F5> :so ' . g:session_dir . '/'")

-- quick change foldmethod..
vim.keymap.set("", "<leader>fm", ":set foldmethod=", opts)

-- quick change filetype..
vim.keymap.set("", "<leader>ty", ":set ft=", opts)

-- Quick edit files (dotfiles, i3, zsh, nvim, snippets)
vim.keymap.set("n", "<leader>dot", ":e ~/dotfiles/README.md<CR>", opts)
vim.keymap.set('n', '<leader>i3', ':e ~/dotfiles/i3/config<CR>', opts)
vim.keymap.set('n', '<leader>zsh', ':e ~/dotfiles/zsh/zshrc<CR>', opts)
vim.keymap.set('n', '<leader>av', ':e ~/dotfiles/alacritty/alacritty.yml<CR>', opts)
vim.keymap.set('n', '<leader>ev', ':e ~/dotfiles/nvim-new/init.lua<CR>', opts)
vim.keymap.set('n', '<leader>evk', ':e ~/dotfiles/nvim/lua/core/keymaps.lua<CR>', opts)
vim.keymap.set('n', '<leader>ee', ':e ~/dotfiles/nvim/snippets/snipmate/', opts)

-- Better window navigation
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)

-- navigate buffers with L H
vim.keymap.set("n", "<S-l>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", opts)

-- Resize with ctrl arrows
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Clear highlights
vim.keymap.set("n", "<Space><Space>", "<cmd>nohlsearch<CR><cmd>Noice dismiss<CR>", opts)


-- Save current buffer
vim.keymap.set("n", "<C-s>", ":w<CR>", opts)
vim.keymap.set("i", "<C-s>", "<ESC>:w<CR>a", opts)
vim.keymap.set("n", "<leader>s", ":noautocmd w<CR>", opts)
vim.keymap.set("i", "<leader>s", ":noautocmd w<CR>", opts)

-- Toggle to previous buffer
vim.keymap.set("n", "<Tab>", ":b#<CR>", opts)

-- Reload file com <leader>r
vim.keymap.set("n", "<leader>r", ":e!<cr>", opts)

-- Shell exec line under cursor
vim.keymap.set("i", "<F3>", "<ESC>:.!sh<CR>", opts)
vim.keymap.set("n", "<F3>", "<ESC>:.!sh<CR>", opts)

-- Visual --
-- Stay in indent mode when changing identation
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- gx open link in browser
-- vim.keymap.set("n", "gx", [[:silent execute '!$BROWSER ' . shellescape(expand('<cfile>'), 1)<CR>]], opts)

-- Carry line with CTRL J K
vim.cmd("nnoremap <C-J> :m .+1<CR>==")
vim.cmd("nnoremap <C-K> :m .-2<CR>==")
vim.cmd("inoremap <C-J> <Esc>:m .+1<CR>==gi")
vim.cmd("inoremap <C-K> <Esc>:m .-2<CR>==gi")
vim.cmd("vnoremap <C-J> :m '>+1<CR>gv=gv")
vim.cmd("vnoremap <C-K> :m '<-2<CR>gv=gv")

--  -------------------------
--  Laravel Mappings
--  -------------------------
vim.keymap.set("n", "<leader>lev", ":e .env<CR>", opts)
vim.keymap.set("n", "<leader>lrw", ":e routes/web.php<CR>", opts)
vim.keymap.set("n", "<leader>lra", ":e routes/api.php<CR>", opts)
vim.keymap.set('n', '<leader>ll', ':e ./storage/logs/laravel.log<CR>', opts)

