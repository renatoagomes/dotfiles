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
	require "plugins.lsp",
	require "plugins.misc",
	require "plugins.copilot",
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
