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
keymap("n", "-v", ":lua ToggleDiagnosticVirtualText()<cr>", opts)
keymap("n", "<leader>dt", ":lua ToggleDiagnostic()<cr>", opts)

keymap("n", "-C", ":lua SwitchCase()<cr>", opts)

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

function ToggleDiagnosticVirtualText()
  if (vim.diagnostic.config().virtual_text == true) then
    vim.diagnostic.config({ virtual_text = false })
  else
    vim.diagnostic.config({ virtual_text = true })
  end
end

function ToggleDiagnostic()
  if (vim.diagnostic.enable() == true) then
    vim.diagnostic.disable()
  else
    vim.diagnostic.enable()
  end
end

function SwitchCase()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  local word = vim.fn.expand('<cword>')
  local word_start = vim.fn.matchstrpos(vim.fn.getline('.'), '\\k*\\%' .. (col+1) .. 'c\\k*')[2]
  local transformedWord = ConvertCase(word)
  vim.api.nvim_buf_set_text(0, line - 1, word_start, line - 1, word_start + #word, {transformedWord})
end

-- not working 100%
function ConvertCase(inputString)
    local isCamelCase = inputString:match("[a-z][A-Z]") ~= nil

    if isCamelCase then
        return (inputString:gsub("%u", function(match)
            return " " .. string.lower(match)
        end)):gsub("^%l", string.upper)
    else
        local result = inputString:gsub("[ _%-]", function(match)
            return match == "-" and " " or ""
        end)
        return result:gsub("%w+", function(match)
            return match:sub(1, 1):upper() .. match:sub(2)
        end)
    end
end

