return {
	{
		'z0rzi/ai-chat.nvim',
		config = function()
			require('ai-chat').setup {}
		end,
	},
	{
		"github/copilot.vim",
		config = function()
			vim.api.nvim_set_keymap("i", "<C-m>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
			vim.api.nvim_set_keymap("i", "<S-Tab>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

			vim.g.copilot_filetypes = {
				["*"] = false,
				["javascript"] = true,
				["typescript"] = true,
				["python"] = true,
				["lua"] = false,
				["vue"] = true,
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
		end
	}
}
