-- Shorten function name 
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
-- keymap("", ",", "<Nop>", opts)
vim.g.mapleader = ","

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

-- Changing foldmethod..
keymap("", "<leader>fm", ":set foldmethod=", opts)

-- Changing filetype..
keymap("", "<leader>ty", ":set ft=", opts)

-- Quick edit files (dotfiles, i3, zsh, vim, snippets)
keymap("n", "<leader>dot", ":e ~/dotfiles/README.md<CR>", opts)
keymap('n', '<leader>i3', ':e ~/dotfiles/i3/config<CR>', opts)
keymap('n', '<leader>zsh', ':e ~/dotfiles/zsh/zshrc<CR>', opts)
keymap('n', '<leader>av', ':e ~/dotfiles/alacritty/alacritty.yml<CR>', opts)
-- keymap('n', '<leader>es', ':e ~/dotfiles/vim/UltiSnips/', opts)
keymap('n', '<leader>ev', ':e ~/dotfiles/nvim/init.lua<CR>', opts)
keymap('n', '<leader>evp', ':e ~/dotfiles/nvim/lua/user/plugins.lua<CR>', opts)
keymap('n', '<leader>evm', ':e ~/dotfiles/nvim/lua/user/keymaps.lua<CR>', opts)
keymap('n', '<leader>evk', ':e ~/dotfiles/nvim/lua/user/keymaps.lua<CR>', opts)
keymap('n', '<leader>ee', ':e ~/dotfiles/nvim/snippets/snipmate/', opts)
keymap('n', '<leader>ll', ':e ./storage/logs/laravel.log<CR>', opts)

-- keymap('n', '<leader>evs', ':e ~/dotfiles/vim/settings.vimrc<cr>', opts)
-- keymap('n', '<leader>evv', ':e ~/dotfiles/vim/visual.vimrc<cr>', opts)
-- keymap('n', '<leader>evw', ':e ~/dotfiles/vim/workflow.vimrc<cr>', opts)

-- seed file (para recarregar as confs do vim sem ter que dar restart)
-- keymay("n", "<leader>S", ":source ~/dotfiles/nvim/init.lua<CR>", opts)


-- Normal --
-- Better window navigation
-- keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)

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

-- Save current buffer 
keymap("n", "<C-s>", ":w<CR>", opts)
keymap("i", "<C-s>", "<ESC>:w<CR>a", opts)

-- Toggle to previous buffer 
keymap("n", "<Tab>", ":b#<CR>", opts)

-- Better paste
-- keymap("v", "p", '"_dP', opts)

-- Reload file com <leader>r
keymap("n", "<leader>r", ":e!<cr>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
keymap("i", "!!!", "<ESC>:.!sh<CR>", opts)
keymap("i", ",,,,", "<ESC>:.!sh<CR>", { silent = true})

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
keymap("n", "<leader>fc", ":Telescope git_commits<CR>", opts)
keymap("n", "<leader>fg", ":Telescope git_commits<CR>", opts)

-- Comment
-- keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')

-- DAP (debugging)
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

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

-- Float terminal 
vim.cmd("tnoremap <Esc><Esc> <C-\\><C-n>")
vim.cmd("nnoremap   <silent>   <F6>    :FloatermNew<CR>")
vim.cmd("tnoremap   <silent>   <F6>    <C-\\><C-n>:FloatermNew<CR>")
vim.cmd("nnoremap   <silent>   <F7>    :FloatermPrev<CR>")
vim.cmd("tnoremap   <silent>   <F7>    <C-\\><C-n>:FloatermPrev<CR>")
vim.cmd("nnoremap   <silent>   <F8>    :FloatermNext<CR>")
vim.cmd("tnoremap   <silent>   <F8>    <C-\\><C-n>:FloatermNext<CR>")
vim.cmd("nnoremap   <silent>   <F9>    :FloatermToggle<CR>")
vim.cmd("tnoremap   <silent>   <F9>    <C-\\><C-n>:FloatermToggle<CR>")
vim.cmd("nnoremap   <silent>   <leader><leader>    :FloatermToggle<CR>")
keymap("n", "<F9>", ":FloatermToggle<cr>", opts)

-- " Float terminal config
vim.cmd("let g:floaterm_wintype='split'")
vim.cmd("let g:floaterm_width=0.9")
vim.cmd("let g:floaterm_height=0.4")
vim.cmd("let g:terminal_color_4 = '#ff0000'")
vim.cmd("let g:terminal_color_5 = 'green'")
vim.cmd("let g:floaterm_autoinsert = v:true")
vim.cmd("let g:floaterm_title = '$ $1/$2'")
vim.cmd("hi Floaterm guibg=black")
vim.cmd("hi FloatermBorder guibg=orange guifg=cyan")


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
vim.cmd("nmap <leader>lev :e .env<cr>")
vim.cmd("nmap <leader>lrw :e routes/web.php<cr>")
vim.cmd("nmap <leader>lra :e routes/api.php<cr>")

-- Wildmenu completion
vim.cmd("call wilder#setup({'modes': [':', '/', '?']})")

-- COC goto definition
-- vim.cmd("nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>")

-- Tagbar 
vim.cmd("nnoremap <leader>tb :TagbarToggle<CR>")

-- PDV 
vim.cmd('let g:pdv_template_dir = $HOME . "/.vim/plugged/pdv/templates_snip"')
vim.cmd("nnoremap <leader>doc :call pdv#DocumentWithSnip()<CR>")




keymap("v", "<C-Space>", ">gv", opts)



-- Function calls 
keymap("n", "-c", ":lua ToggleColors()<cr>", opts)
keymap("n", "<leader><leader>", ":FloatermToggle<cr>", opts)
keymap("n", "-n", ":lua ToggleNumbers()<cr>", opts)
keymap("n", "-a", ":lua ToggleAim()<cr>", opts)
keymap("n", "-l", ":lua ToggleLineAim()<cr>", opts)


-- vim.keymap.set('i', '<M-.>', '<Plug>(copilot-next)')
-- vim.keymap.set('i', '<M-,>', '<Plug>(copilot-previous)')
-- vim.cmd("let g:copilot_assume_mapped = v:true")

-- vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-m>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- -- Harpoon Which-key mappings
-- local wk = require("which-key")
--
-- -- flash
-- wk.register({
--     -- flash search
--     l = {
--         name = "flash",
--         s = { function() require("flash").jump() end, "Flash Jump" },
--         t = { function() require("flash").treesitter() end, "Flash Treesitter" },
--         r = { function() require("flash").treesitter_search() end, "Flash Treesitter Search" },
--     },
-- }, { prefix = "<leader>" })
--

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

vim.keymap.set('n', 'K', function()
    local winid = require('ufo').peekFoldedLinesUnderCursor()
    if not winid then
        -- choose one of coc.nvim and nvim lsp
        -- vim.fn.CocActionAsync('definitionHover') -- coc.nvim
        vim.lsp.buf.hover()
    end
end)


vim.g.copilot_filetypes = {
  ["*"] = false,
  ["javascript"] = true,
  ["typescript"] = true,
  ["python"] = true,
  ["lua"] = false,
  ['php'] = true,
  ['html'] = true,
  ['css'] = true,
  ['scss'] = true,
  ['javascriptreact'] = true,
  ['typescriptreact'] = true,
  ['json'] = true,
  ['yaml'] = true,
  ['toml'] = true,
  ['vim'] = true,
  ['sh'] = true,
  ['zsh'] = true,
  ['bash'] = true,
  ['fish'] = true,
  ['c'] = true,
  ['cpp'] = true,
  ['go'] = true,
  ['rust'] = true,
  ['java'] = true,
  ['ruby'] = true,
}
