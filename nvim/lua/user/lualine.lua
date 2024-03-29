local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = { error = " ", warn = " " },
  colored = false,
  always_visible = true,
}

local diff = {
  "diff",
  colored = false,
  symbols = { added = "", modified = "", removed = "" }, -- changes diff symbols
  cond = hide_in_width,
}

local filename = {
  "filename",
  icons_enabled = true,
}

local location = {
  "location",
  padding = 0,
}

local bname = function()
  return vim.api.nvim_buf_get_name(0)
end

local lines = function ()
  local buf = vim.api.nvim_get_current_buf()
  return vim.api.nvim_buf_line_count(buf)
end

local custom_auto = require'lualine.themes.auto'

-- Change the background of lualine_c section for normal mode
-- custom_auto.normal.a.bg = '#555'
-- custom_auto.normal.b.bg = '#555'
-- custom_auto.normal.c.bg = '#555'

lualine.setup {
  options = {
    globalstatus = true,
    icons_enabled = true,
    theme = custom_auto,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "alpha", "dashboard" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = {"branch"},
    lualine_c = { diagnostics, filename },
    lualine_x = { bname },
    lualine_y = { location },
    lualine_z = { lines, progress },
  },
}
