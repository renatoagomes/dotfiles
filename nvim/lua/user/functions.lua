
-- Terminal handling
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
  ToggleNumbers()
end

function ToggleLineAim()
  vim.cmd(":set cursorline!")
end

function ToggleAim()
  vim.cmd(":set cursorcolumn! cursorline!")
end

function ToggleNumbers()
  vim.cmd(":set nu! relativenumber!")
end

-- function ToggleFolding()
--
-- if  then
--   
-- end
--
--
--     if &foldcolumn ==# 0 
--       set foldcolumn=1 foldmethod=indent 
--
-- | else 
--
-- | set foldcolumn=0 foldmethod=manual 
--
-- | endif
-- end
