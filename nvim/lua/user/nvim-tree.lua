local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
  update_focused_file = {
    enable = true,
    update_cwd = false,
  },
  renderer = {
    root_folder_modifier = ":t",
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  git = {
    enable = true,
    ignore = false,
  },
  view = {
    width = 50,
    height = 30,
    side = "left",
    mappings = {
      list = {
        { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
        { key = "h", cb = tree_cb "close_node" },
        { key = "v", cb = tree_cb "vsplit" },
      },
    },
  },
}

  -- view.mappings.list = { -- BEGIN_DEFAULT_MAPPINGS
  --   { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" }
  --   { key = "<C-e>",                          action = "edit_in_place" }
  --   { key = "O",                              action = "edit_no_picker" }
  --   { key = { "<C-]>", "<2-RightMouse>" },    action = "cd" }
  --   { key = "<C-v>",                          action = "vsplit" }
  --   { key = "<C-x>",                          action = "split" }
  --   { key = "<C-t>",                          action = "tabnew" }
  --   { key = "<",                              action = "prev_sibling" }
  --   { key = ">",                              action = "next_sibling" }
  --   { key = "P",                              action = "parent_node" }
  --   { key = "<BS>",                           action = "close_node" }
  --   { key = "<Tab>",                          action = "preview" }
  --   { key = "K",                              action = "first_sibling" }
  --   { key = "J",                              action = "last_sibling" }
  --   { key = "I",                              action = "toggle_git_ignored" }
  --   { key = "H",                              action = "toggle_dotfiles" }
  --   { key = "U",                              action = "toggle_custom" }
  --   { key = "R",                              action = "refresh" }
  --   { key = "a",                              action = "create" }
  --   { key = "d",                              action = "remove" }
  --   { key = "D",                              action = "trash" }
  --   { key = "r",                              action = "rename" }
  --   { key = "<C-r>",                          action = "full_rename" }
  --   { key = "x",                              action = "cut" }
  --   { key = "c",                              action = "copy" }
  --   { key = "p",                              action = "paste" }
  --   { key = "y",                              action = "copy_name" }
  --   { key = "Y",                              action = "copy_path" }
  --   { key = "gy",                             action = "copy_absolute_path" }
  --   { key = "[c",                             action = "prev_git_item" }
  --   { key = "]c",                             action = "next_git_item" }
  --   { key = "-",                              action = "dir_up" }
  --   { key = "s",                              action = "system_open" }
  --   { key = "f",                              action = "live_filter" }
  --   { key = "F",                              action = "clear_live_filter" }
  --   { key = "q",                              action = "close" }
  --   { key = "W",                              action = "collapse_all" }
  --   { key = "E",                              action = "expand_all" }
  --   { key = "S",                              action = "search_node" }
  --   { key = ".",                              action = "run_file_command" }
  --   { key = "<C-k>",                          action = "toggle_file_info" }
  --   { key = "g?",                             action = "toggle_help" }
  -- } -- END_DEFAULT_MAPPINGS
