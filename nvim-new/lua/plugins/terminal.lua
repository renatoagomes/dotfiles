return  {
	{
		"akinsho/toggleterm.nvim",
		config = function ()
			require("toggleterm").setup({
				size = 20,
				open_mapping = [[<c-\>]],
				hide_numbers = true,
				shade_terminals = true,
				shading_factor = 2,
				start_in_insert = true,
				insert_mappings = true,
				persist_size = true,
				direction = "float",
				close_on_exit = true,
				shell = vim.o.shell,
				float_opts = {
					border = "curved",
				},
			})

			function _G.set_terminal_keymaps()
				local opts = {noremap = true}
				-- vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
				vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
				vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
				vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
				vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
			end

			vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

			local Terminal = require("toggleterm.terminal").Terminal
			local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

			function _LAZYGIT_TOGGLE()
				lazygit:toggle()
			end
		end
	},
	{
		"voldikss/vim-floaterm",
		config = function ()
			local keymap = vim.keymap.set
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

		end
	}
}
