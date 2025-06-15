return  {
	{
		"vimwiki/vimwiki",
		init = function()
			vim.g.vimwiki_list = {
				{ path = '~/vimwiki/', syntax = 'markdown', ext = '.md', auto_tags = 1 },
			}
			vim.g.vimwiki_filetypes = { "markdown" }
			vim.g.vimwiki_key_mappings = { table_mappings = 0 }
			vim.g.instant_markdown_autostart = 0

			vim.keymap.set('n', '<F1>', ":VimwikiIndex<CR>", { desc = 'Wiki Index' })
		end,
	}
}

