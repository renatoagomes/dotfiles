local colorscheme = "darkplus"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end

-- Sets bg fg colors between windows
vim.cmd("hi VertSplit guifg=DarkGray guibg=bg")
