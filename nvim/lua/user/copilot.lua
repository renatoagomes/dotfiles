-- vim.keymap.set('i', '<M-.>', '<Plug>(copilot-next)')
-- vim.keymap.set('i', '<M-,>', '<Plug>(copilot-previous)')
-- vim.cmd("let g:copilot_assume_mapped = v:true")

-- vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-m>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

vim.g.copilot_filetypes = {
  ["*"] = false,
  ["javascript"] = true,
  ["typescript"] = true,
  ["python"] = true,
  ["lua"] = false,
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
