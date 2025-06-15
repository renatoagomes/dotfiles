--[[ return { ]]
--[[     "nvim-neo-tree/neo-tree.nvim", ]]
--[[     branch = "v3.x", ]]
--[[     dependencies = { ]]
--[[       "nvim-lua/plenary.nvim", ]]
--[[       "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended ]]
--[[       "MunifTanjim/nui.nvim", ]]
--[[       -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information ]]
--[[     } ]]
--[[ } ]]

return {
	'nvim-tree/nvim-tree.lua',
	dependencies = {
		'nvim-tree/nvim-web-devicons', -- optional
	},
	config = function()
		require("nvim-tree").setup({
			update_focused_file = {
				enable = true,
				update_cwd = false,
			},
			renderer = {
				root_folder_modifier = ":t",
				icons = {
					glyphs = {
						default = "",
						symlink = "",
						folder = {
							arrow_open = "",
							arrow_closed = "",
							default = "",
							open = "",
							empty = "",
							empty_open = "",
							symlink = "",
							symlink_open = "",
						},
						git = {
							unstaged = "",
							staged = "S",
							unmerged = "",
							renamed = "➜",
							untracked = "U",
							deleted = "",
							ignored = "◌",
						},
					},
				},
			},
			diagnostics = {
				enable = true,
				show_on_dirs = true,
				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
				},
			},
			git = {
				enable = true,
				ignore = false,
			},
			view = {
				width = 50,
			},
		})
		vim.keymap.set("n", "<leader>n", ":NvimTreeFindFileToggle<CR>", { silent = true })
	end
}
