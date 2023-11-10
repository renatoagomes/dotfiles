local colorscheme = "darkplus"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end

-- Sets bg fg colors between windows
vim.cmd("hi VertSplit guifg=DarkGray guibg=bg")
-- vim.cmd("hi  guifg=DarkGray guibg=bg")

-- vim.cmd("let g:terminal_color_4 = '#ff0000'")
-- vim.cmd("let g:terminal_color_5 = 'green'")

-- vim.cmd("hi WhichKeyFloat guifg=DarkGray guibg=bg")
