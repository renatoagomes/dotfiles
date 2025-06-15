local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)


vim.g.mapleader = ","


require("lazy").setup(
	{
		"nvim-lua/plenary.nvim",
		"windwp/nvim-autopairs",
		"numToStr/Comment.nvim",
		"JoosepAlviste/nvim-ts-context-commentstring",

		{
			'nvim-tree/nvim-tree.lua',
			dependencies = {
				'nvim-tree/nvim-web-devicons', -- optional
			},
		},

		"akinsho/bufferline.nvim",
		"moll/vim-bbye",
		"nvim-lualine/lualine.nvim",
		"akinsho/toggleterm.nvim",
		"ahmedkhalf/project.nvim",
		"lewis6991/impatient.nvim",
		-- use { "lukas-reineke/indent-blankline.nvim" }
		"goolord/alpha-nvim",

		--  which key
		{
			"folke/which-key.nvim",
			config = function()
				vim.o.timeout = true
				vim.o.timeoutlen = 300
				require("which-key").setup {
					-- your configuration comes here
					-- or leave it empty to use the default settings
					-- refer to the configuration section below
				}
			end
		},

		{
			'z0rzi/ai-chat.nvim',
			config = function()
				require('ai-chat').setup {}
			end,
		},

		-- Colorschemes
		"folke/tokyonight.nvim",
		"olimorris/onedarkpro.nvim",
		'w0ng/vim-hybrid',
		'nanotech/jellybeans.vim',
		--[[ use { "lunarvim/darkplus.nvim", commit = "2584cdeefc078351a79073322eb7f14d7fbb1835" } ]]

		-- cmp plugins
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"roobert/tailwindcss-colorizer-cmp.nvim",

		'tpope/vim-fugitive',

		-- Snippets snippets
		"L3MON4D3/LuaSnip",
		"mattn/emmet-vim",
		"SirVer/ultisnips",

		-- Php docblock generation
		"tobyS/vmustache",
		"tobyS/pdv",

		-- blade support
		"jwalton512/vim-blade",

		-- Mason and LSP
		{
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		},

		--[[ use { "williamboman/nvim-lsp-installer" } -- simple to use language server installer ]]
		"jose-elias-alvarez/null-ls.nvim",

		'mhartington/formatter.nvim',

		-- Copilot
		"github/copilot.vim",

		-- Telescope
		"nvim-telescope/telescope.nvim",

		-- Treesitter
		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
			config = function()
				local configs = require("nvim-treesitter.configs")

				configs.setup({
					ensure_installed = { "awk", "bash", "c", "clojure", "cmake", "corn", "cpon", "cpp", "css", "csv",
						"diff",
						"dockerfile", "dot", "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore", "gpg",
						"graphql",
						"heex", "html", "http", "javascript", "jq", "jsdoc", "json", "json5", "jsonc", "latex", "lua",
						"luadoc",
						"markdown", "markdown_inline", "passwd", "perl", "php", "phpdoc", "prisma", "pymanifest",
						"python", "query",
						"racket", "rasi", "re2c", "regex", "ron", "rst", "ruby", "scheme", "scss", "solidity", "sql",
						"ssh_config",
						"tsx", "typescript", "typoscript", "vim", "vimdoc", "vue", "xml", "yaml"
					},

					sync_install = false,
					highlight = { enable = true },
					indent = { enable = true },
				})
			end
		},

		-- DAP debug
		-- use { "mfussenegger/nvim-dap", commit = "014ebd53612cfd42ac8c131e6cec7c194572f21d" }
		-- use { "rcarriga/nvim-dap-ui", commit = "d76d6594374fb54abf2d94d6a320f3fd6e9bb2f7" }
		-- use { "ravenxrz/DAPInstall.nvim", commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de" }
		-- use "nvim-telescope/telescope-dap.nvim"

		-- Floating terminal
		"voldikss/vim-floaterm",

		-- Vim wiki
		{
			"vimwiki/vimwiki",
			init = function()
				vim.g.vimwiki_list = {
					{ path = '~/vimwiki/', syntax = 'markdown', ext = '.md', auto_tags = 1 },
				}
				vim.g.vimwiki_filetypes = { "markdown" }
				vim.g.vimwiki_key_mappings = { table_mappings = 0 }
				vim.g.instant_markdown_autostart = 0
			end,
		},

		-- Multicursor
		"mg979/vim-visual-multi",

		--[[ -- Better wildmenu completion ]]
		--[[ { ]]
		--[[   "gelguy/wilder.nvim", ]]
		--[[   keys = { "/", "?", ":" }, ]]
		--[[   build = ":UpdateRemotePlugins" ]]
		--[[ }, ]]
		--[[ { ]]
		--[[   'gelguy/wilder.nvim', ]]
		--[[   config = function() ]]
		--[[     require('wilder').setup({ ]]
		--[[       modes = {':', '/', '?'} ]]
		--[[     }) ]]
		--[[   end, ]]
		--[[   build = ':UpdateRemotePlugins' ]]
		--[[ }, ]]

		-- Tagbar (show buffer tags to navigate) <leader>tb
		--[[ use 'preservim/tagbar' ]]

		-- Editorconfig
		"editorconfig/editorconfig-vim",

		-- Log syntax highlight
		"mtdl9/vim-log-highlighting",

		-- better folding
		{
			"kevinhwang91/nvim-ufo",
			dependencies = {
				"kevinhwang91/promise-async",
				{
					"luukvbaal/statuscol.nvim",
					config = function()
						local builtin = require("statuscol.builtin")
						require("statuscol").setup(
							{
								relculright = true,
								segments = {
									{ text = { " %s ", " " },           click = "v:lua.ScSa" },
									{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
									{ text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" }
								}
							}
						)
					end
				}
			}
		},

		-- GitSigns
		"lewis6991/gitsigns.nvim",

		"NvChad/nvim-colorizer.lua",

		{
			"folke/noice.nvim",
			event = "VeryLazy",
			opts = {
				-- add any options here
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
		{
			"folke/trouble.nvim",
			dependencies = { "nvim-tree/nvim-web-devicons" },
			opts = {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			},
		},

		{
			"catgoose/vue-goto-definition.nvim",
			event = "BufReadPre",
			opts = {
				filters = {
					auto_imports = true,
					auto_components = true,
					import_same_file = true,
					declaration = true,
					duplicate_filename = true,
				},
				filetypes = { "vue", "typescript" },
				detection = {
					nuxt = function()
						return vim.fn.glob(".nuxt/") ~= ""
					end,
					vue3 = function()
						return vim.fn.filereadable("vite.config.ts") == 1 or vim.fn.filereadable("src/App.vue") == 1
					end,
					priority = { "nuxt", "vue3" },
				},
				lsp = {
					override_definition = true, -- override vim.lsp.buf.definition
				},
				debounce = 200
			}
		},

--[[ {spec = {'tadaa/vimade'}} ]]

	})


require "user.options"
require "user.functions"
require "user.keymaps"
--[[ require "user.plugins" ]]
require "user.colorscheme"
require "user.autocommands"
require "user.cmp"
require "user.telescope"
--[[ require "user.treesitter" ]]
require "user.autopairs"
require "user.comment"
require "user.gitsigns"
require "user.nvim-tree"
require "user.bufferline"
require "user.lualine"
require "user.toggleterm"
require "user.project"
require "user.impatient"
require "user.illuminate"
require "user.indentline"
require "user.alpha"
require "user.mason"
require "user.lsp"
require "user.copilot"
require "user.folding"
require "user.terminal"

-- Utilities for creating configurations
local util = require "formatter.util"

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		-- Formatter configurations for filetype "lua" go here
		-- and will be executed in order
		lua = {
			-- "formatter.filetypes.lua" defines default configurations for the
			-- "lua" filetype
			require("formatter.filetypes.lua").stylua,

			-- You can also define your own configuration
			function()
				-- Supports conditional formatting
				if util.get_current_buffer_file_name() == "special.lua" then
					return nil
				end

				-- Full specification of configurations is down below and in Vim help
				-- files
				return {
					exe = "stylua",
					args = {
						"--search-parent-directories",
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
						"--",
						"-",
					},
					stdin = true,
				}
			end
		},

		-- Use the special "*" filetype for defining formatter configurations on
		-- any filetype
		["*"] = {
			-- "formatter.filetypes.any" defines default configurations for any
			-- filetype
			require("formatter.filetypes.any").remove_trailing_whitespace
		}
	}
}

require("noice").setup({
	lsp = {
		-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
		},
	},
	-- you can enable a preset for easier configuration
	presets = {
		bottom_search = false,  -- use a classic bottom cmdline for search
		command_palette = true, -- position the cmdline and popupmenu together
		long_message_to_split = true, -- long messages will be sent to a split
		inc_rename = false,     -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = false, -- add a border to hover docs and signature help
	},
})


--[[ require "user.dap" ]]

--[[ local wilder = require('wilder') ]]
--[[ wilder.set_option('use_python_remote_plugin', 0) ]]
--[[ wilder.setup({ modes = { '/', '?', ':' } }) ]]
--[[]]
--[[ wilder.set_option('pipeline', { ]]
--[[   wilder.branch( ]]
--[[     wilder.python_file_finder_pipeline({ ]]
--[[       file_comand = { 'find', '.', '-type', 'f', '-printf', '%P\n' }, ]]
--[[       dir_comand = { 'find', '.', '-type', 'd', '-printf', '%P\n' }, ]]
--[[       filters = { 'fuzzy_filter', 'difflib_sorter' }, ]]
--[[     }), ]]
--[[     wilder.cmdline_pipeline(), ]]
--[[     wilder.python_search_pipeline() ]]
--[[   ), ]]
--[[ }) ]]
