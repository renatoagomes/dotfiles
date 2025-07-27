return {
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
		},
		config = function ()
			local foldSufixHandler = function(virtText, lnum, endLnum, width, truncate)
				local newVirtText = {}
				local suffix = (' 󰁂 %d Lines '):format(endLnum - lnum)
				local sufWidth = vim.fn.strdisplaywidth(suffix)
				local targetWidth = width - sufWidth
				local curWidth = 0
				for _, chunk in ipairs(virtText) do
					local chunkText = chunk[1]
					local chunkWidth = vim.fn.strdisplaywidth(chunkText)
					if targetWidth > curWidth + chunkWidth then
						table.insert(newVirtText, chunk)
					else
						chunkText = truncate(chunkText, targetWidth - curWidth)
						local hlGroup = chunk[2]
						table.insert(newVirtText, {chunkText, hlGroup})
						chunkWidth = vim.fn.strdisplaywidth(chunkText)
						-- str width returned from truncate() may less than 2nd argument, need padding
						if curWidth + chunkWidth < targetWidth then
							suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
						end
						break
					end
					curWidth = curWidth + chunkWidth
				end
				table.insert(newVirtText, {suffix, 'MoreMsg'})
				return newVirtText
			end

			-- Using ufo provider need remap `zR` and `zM`.
			vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
			vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
			-- vim.keymap.set('n', 'K', function()
			-- 	local winid = require('ufo').peekFoldedLinesUnderCursor()
			-- 	if not winid then
			-- 		-- choose one of coc.nvim and nvim lsp
			-- 		-- vim.fn.CocActionAsync('definitionHover') -- coc.nvim
			-- 		vim.lsp.buf.hover()
			-- 	end
			-- end)

			require('ufo').setup({
				fold_virt_text_handler = foldSufixHandler,
				open_fold_hl_timeout = 150,
				close_fold_kinds_for_ft = {
				  default = { 'imports', 'comment' },
				},
				preview = {
					win_config = {
						border = {'', '─', '', '', '', '─', '', ''},
						winhighlight = 'Normal:Folded',
						winblend = 0
					},
					mappings = {
						scrollU = '<C-u>',
						scrollD = '<C-d>',
						jumpTop = '[',
						jumpBot = ']'
					}
				},
				provider_selector = function(bufnr, filetype, buftype)
					return {"treesitter", "indent"}
				end
			})
		end
	},
}
