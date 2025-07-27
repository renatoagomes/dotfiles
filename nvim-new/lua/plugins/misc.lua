return {

	'tpope/vim-sleuth',    -- Detect tabstop and shiftwidth automatically

	"mg979/vim-visual-multi", -- Multicursor

	{
		"ahmedkhalf/project.nvim", -- project wd
		config = function()
			require('project_nvim').setup({
				-- Manual mode doesn't automatically change your root directory, so you have
				-- the option to manually do so using `:ProjectRoot` command.
				manual_mode = false,

				-- Methods of detecting the root directory. **"lsp"** uses the native neovim
				-- lsp, while **"pattern"** uses vim-rooter like glob pattern matching. Here
				-- order matters: if one is not detected, the other is used as fallback. You
				-- can also delete or rearangne the detection methods.
				detection_methods = { "lsp", "pattern" },

				-- All the patterns used to detect root dir, when **"pattern"** is in
				-- detection_methods
				patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "composer.json" },

				-- Table of lsp clients to ignore by name
				-- eg: { "efm", ... }
				ignore_lsp = {},

				-- Don't calculate root dir on specific directories
				-- Ex: { "~/.cargo/*", ... }
				exclude_dirs = {},

				-- Show hidden files in telescope
				show_hidden = false,

				-- When set to false, you will get a message when project.nvim changes your
				-- directory.
				silent_chdir = true,

				-- What scope to change the directory, valid options are
				-- * global (default)
				-- * tab
				-- * win
				scope_chdir = 'global',

				-- Path where project.nvim will store the project history for use in
				-- telescope
				datapath = vim.fn.stdpath("data"),
			})
		end
	},
	{
		"moll/vim-bbye",
		config = function()
			vim.keymap.set("n", "<C-q>", "<cmd>Bdelete<CR>", { silent = true, noremap = true })
		end
	},

	"mattn/emmet-vim",
	"SirVer/ultisnips",

	-- Php docblock generation
	"tobyS/vmustache",
	{
		"tobyS/pdv",
		config = function()
			-- PDV
			vim.cmd('let g:pdv_template_dir = $HOME . "/.vim/plugged/pdv/templates_snip"')
			vim.cmd("nnoremap <leader>doc :call pdv#DocumentWithSnip()<CR>")
		end
	},

	-- blade support
	"jwalton512/vim-blade",

	"NvChad/nvim-colorizer.lua",

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {

		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		}
	},

}
