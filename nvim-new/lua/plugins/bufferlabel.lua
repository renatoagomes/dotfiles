-- lua/buffer_label/init.lua

local M = {}
local is_label_visible = false  -- Tracks the visibility state

-- Function to toggle buffer name label
function M.toggle_buffer_label()
  is_label_visible = not is_label_visible
  M.update_labels()
end

-- Function to update labels based on `is_label_visible`
function M.update_labels()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local buf_name = vim.api.nvim_buf_get_name(buf)
    if buf_name ~= "" then
      -- Get the first visible line in the current split
      local first_visible_line = vim.fn.line("w0", win) - 1  -- Lua indexing starts from 0
      local line_content = vim.api.nvim_buf_get_lines(buf, first_visible_line, first_visible_line + 1, false)[1] or ""

      if is_label_visible then
        -- Append the buffer name if not already present
        local new_line = line_content:gsub("%s*%[%S+%]$", "") .. " [" .. vim.fn.fnamemodify(buf_name, ":t") .. "]"
        vim.api.nvim_buf_set_lines(buf, first_visible_line, first_visible_line + 1, false, {new_line})
      else
        -- Remove the buffer name if present
        local new_line = line_content:gsub("%s*%[%S+%]$", "")
        vim.api.nvim_buf_set_lines(buf, first_visible_line, first_visible_line + 1, false, {new_line})
      end
    end
  end
end

return M
