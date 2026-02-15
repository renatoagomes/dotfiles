require "core.options"
require "core.keymaps"

-- Lazy config
		local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
		if not (vim.uv or vim.loop).fs_stat(lazypath) then
			local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
			local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
			if vim.v.shell_error ~= 0 then
				error('Error cloning lazy.nvim:\n' .. out)
			end
		end ---@diagnostic disable-next-line: undefined-field
		vim.opt.rtp:prepend(lazypath)

-- Enabled LSPs
vim.lsp.enable({
    "bashls",
    "cssls",
    "docker_compose_language_service",
    "dockerls",
    "html",
    "intelephense",
    "jsonls",
    "lua_ls",
    "pyright",
    "vtsls",
    "eslint",
    "vue_ls",
    "yamlls",
})

require('lazy').setup({
	require "plugins.colorscheme",
	require "plugins.tree",
	require "plugins.gitsigns",
	require "plugins.which-key",
	require "plugins.bufferline",
	require "plugins.comment",
	require "plugins.lualine",
	require "plugins.terminal",
	require "plugins.telescope",
	require "plugins.treesitter",
	require "plugins.vimwiki",
	require "plugins.folding",
	require "plugins.alpha",
	require "plugins.autocompletion",
	require "plugins.mason",
	-- require "plugins.lsp",
	require "plugins.misc",
	require "plugins.copilot",
	require "plugins.opencode",
	"roobert/tailwindcss-colorizer-cmp.nvim",
},{
 ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

require "core.autocommands"
require "core.functions"

require('colorizer').setup({
  user_default_options = {
    tailwind = true,
  }
})


require("notify").setup({
	background_colour = "#302c34",
})

vim.cmd [[
  highlight! link FloatBorder NormalFloat
  highlight! link NormalFloat Pmenu
  highlight! link FloatBorder PmenuBorder

]]

-- vim.cmd [[
--   highlight FloatBorder guifg=#FF0000 guibg=#000000
--   highlight NormalFloat guifg=#00FF00 guibg=#000000
--   highlight Pmenu guifg=#0000FF guibg=#FFFFFF
--   highlight PmenuBorder guifg=#FFFF00 guibg=#000000
-- ]]
