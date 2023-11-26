-- Use 'q' to quit from common plugins
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "qf", "help", "man", "lspinfo", "spectre_panel", "lir" },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR> 
      set nobuflisted 
    ]]
  end,
})

-- Remove statusline and tabline when in Alpha
vim.api.nvim_create_autocmd({ "User" }, {
  pattern = { "AlphaReady" },
  callback = function()
    vim.cmd [[
      set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
      set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
    ]]
  end,
})

-- Set wrap and spell in markdown and gitcommit
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = false 
    require('cmp').setup.buffer { enabled = false }
  end,
})

vim.cmd "autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif"

-- Fixes Autocomment
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  callback = function()
    vim.cmd "set formatoptions-=cro"
  end,
})

-- Highlight Yanked Text
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
  end,
})

-- Customize terminal
vim.api.nvim_create_autocmd('TermOpen', {
  callback = function(ev)
    vim.cmd('setlocal listchars= nonumber norelativenumber nocursorline')
    --[[ vim.cmd('colorscheme onedark') ]]
  end

})

-- Use 'q' to quit from common plugins
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "php" },
  callback = function()
    vim.cmd('set iskeyword+=$')
  end,
})

-- vim.api.nvim_create_autocmd('TermLeave', {
--   command = 'setlocal listchars= nonumber norelativenumber nocursorline'
-- })

-- vim.api.nvim_create_autocmd('ColorScheme', {
--   command = 'highlight NormalFloat ctermbg=NONE ctermfg=NONE'
-- })
-- vim.api.nvim_create_autocmd('ColorScheme', {
--   command = 'highlight WhichKeyFloat ctermbg=NONE guibg=#002222 ctermfg=NONE'
-- })

