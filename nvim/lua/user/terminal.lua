-- Shorten function name 
local keymap = vim.keymap.set

-- Silent keymap option
local opts = { silent = true, noremap = true }

-- Terminal workflow F6 <new>, F7 <prev>, F8 <next>, F9 <toggle>
keymap("n", "<F6>", ":FloatermNew<CR>", opts)
keymap("n", "<F7>", ":FloatermPrev<CR>", opts)
keymap("n", "<F8>", ":FloatermNext<CR>", opts)
keymap("n", "<F9>", ":FloatermToggle<CR>", opts)

keymap("t", "<F6>", "<C-\\><C-n>:FloatermNew<CR>", opts)
keymap("t", "<F7>", "<C-\\><C-n>:FloatermPrev<CR>", opts)
keymap("t", "<F8>", "<C-\\><C-n>:FloatermNext<CR>", opts)
keymap("t", "<F9>", "<C-\\><C-n>:FloatermToggle<CR>", opts)
keymap("t", "<Esc><Esc>", "<C-\\><C-n>", opts)

-- " Float terminal config
--[[ vim.cmd("let g:floaterm_shell='alacritty'") ]]
vim.cmd("let g:floaterm_wintype='split'")
vim.cmd("let g:floaterm_width=0.9")
vim.cmd("let g:floaterm_height=0.4")
vim.cmd("let g:floaterm_autoinsert = v:true")
--[[ vim.cmd("let g:floaterm_title = '$ $1/$2'") ]]
--[[ vim.cmd("let g:terminal_color_4 = '#ff0000'") ]]
--[[ vim.cmd("let g:terminal_color_5 = 'green'") ]]
--[[ vim.cmd("hi Floaterm guibg=black") ]]
--[[ vim.cmd("hi FloatermBorder guibg=orange guifg=cyan") ]]

