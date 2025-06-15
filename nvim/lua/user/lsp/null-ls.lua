local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

--[[ local nls = require("null-ls") ]]
--[[ local opts = { ]]
--[[   root_dir = require("null-ls.utils").root_pattern("package.json", ".neoconf.json", "Makefile", ".git"), ]]
--[[   sources = { ]]
--[[     -- Make sure mason installs the formatters ]]
--[[     nls.builtins.code_actions.eslint_d, ]]
--[[     nls.builtins.diagnostics.eslint_d, ]]
--[[     nls.builtins.formatting.eslint_d, ]]
--[[]]
--[[     formatting.black.with { extra_args = { "--fast" } }, ]]
--[[     formatting.stylua, ]]
--[[     formatting.google_java_format, ]]
--[[     diagnostics.flake8, ]]
--[[]]
--[[     formatting.prettier.with { ]]
--[[       extra_filetypes = { "toml" }, ]]
--[[       extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" }, ]]
--[[     }, ]]
--[[   }, ]]
--[[ } ]]
--[[ nls.setup(opts) ]]


