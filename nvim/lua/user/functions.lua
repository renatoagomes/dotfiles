-- Shorten function name 
local keymap = vim.keymap.set

-- Silent keymap option
local opts = { silent = true }

-- Function calls 
keymap("n", "<F9>", ":lua HandleFloatingTerminal()<cr>", opts)
keymap("n", "-c", ":lua ToggleColors()<cr>", opts)
keymap("n", "-n", ":lua ToggleNumbers()<cr>", opts)
keymap("n", "-a", ":lua ToggleAim()<cr>", opts)
keymap("n", "-l", ":lua ToggleLineAim()<cr>", opts)
keymap("n", "-d", ":lua PrintDate()<cr>", opts)

-- Functions
function ToggleColors()
  local termGuiColors = vim.api.nvim_get_option("termguicolors")
  if not termGuiColors then
    vim.cmd(":set termguicolors")
  end
  if termGuiColors then
    vim.cmd(":set notermguicolors")
  end
end

function HandleFloatingTerminal()
  vim.cmd(":FloatermToggle")
  --[[ vim.cmd("colorscheme onedark") ]]
  --[[ ToggleNumbers() ]]
end

function ToggleLineAim()
  vim.cmd(":set cursorline!")
end

function ToggleAim()
  vim.cmd(":set cursorcolumn! cursorline!")
  vim.cmd(":hi Cursorline guibg='#555'")
end

function ToggleNumbers()
  vim.cmd(":set nu! relativenumber!")
end

function PrintDate()
  vim.cmd(':r!date +\\%c')
end

