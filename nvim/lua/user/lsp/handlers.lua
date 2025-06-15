local M = {}
--[[ local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp") ]]
--[[ if not status_cmp_ok then ]]
--[[   return ]]
--[[ end ]]
--[[]]
--[[ M.capabilities = vim.lsp.protocol.make_client_capabilities() ]]
--[[ M.capabilities.textDocument.completion.completionItem.snippetSupport = true ]]
--[[ M.capabilities.textDocument.foldingRange = { ]]
--[[     dynamicRegistration = false, ]]
--[[     lineFoldingOnly = true ]]
--[[ } ]]
--[[ M.capabilities.client.server_capabilities.semanticTokensProvider = nil ]]
--[[ M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities) ]]
--[[]]
--[[]]
M.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		virtual_text = true, -- disable virtual text
		signs = {
			active = signs, -- show signs
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

--[[]]
--[[ local function lsp_keymaps(bufnr) ]]
--[[   local opts = { noremap = true, silent = true } ]]
--[[   local keymap = vim.api.nvim_buf_set_keymap ]]
--[[   keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts) ]]
--[[   keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts) ]]
--[[   -- keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts) ]]
--[[   keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) ]]
--[[   keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts) ]]
--[[   -- keymap(bufnr, "n", "gr", "<cmd>lua require('telescope.builtin').lsp_references<CR>", opts) ]]
--[[]]
--[[   keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts) ]]
--[[   keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>", opts) ]]
--[[   keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", opts) ]]
--[[   keymap(bufnr, "n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts) ]]
--[[   keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts) ]]
--[[   keymap(bufnr, "n", "gj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts) ]]
--[[   keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts) ]]
--[[   keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts) ]]
--[[   keymap(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts) ]]
--[[   keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts) ]]
--[[ end ]]
--[[]]
--[[ M.on_attach = function(client, bufnr) ]]
--[[   if client.name == "tsserver" then ]]
--[[     client.server_capabilities.document_formatting = false ]]
--[[   end ]]
--[[]]
--[[   if client.name == "sumneko_lua" then ]]
--[[     client.server_capabilities.document_formatting = false ]]
--[[   end ]]
--[[]]
--[[   lsp_keymaps(bufnr) ]]
--[[   local status_ok, illuminate = pcall(require, "illuminate") ]]
--[[   if not status_ok then ]]
--[[     return ]]
--[[   end ]]
--[[   illuminate.on_attach(client) ]]
--[[ end ]]
--[[]]


-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', '<space>k', vim.lsp.buf.signature_help, opts)
		vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set('n', '<space>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
		vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
		vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		vim.keymap.set('n', '<space>f', function()
			vim.lsp.buf.format { async = true }
		end, opts)
	end,
})

return M
