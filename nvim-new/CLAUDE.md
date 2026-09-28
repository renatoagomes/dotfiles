# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration (~2k lines of Lua) using **lazy.nvim** as plugin manager. It targets Neovim 0.10+ with native LSP support via `vim.lsp.enable()`.

## Architecture

**Entry point:** `init.lua` loads in this order:
1. `core/options` and `core/keymaps` — base Neovim settings
2. Lazy.nvim bootstrap (auto-clones if missing)
3. `vim.lsp.enable()` for 13 language servers
4. `lazy.setup()` with plugin specs from `lua/plugins/`
5. `core/autocommands` and `core/functions` — post-plugin setup

**Key directories:**
- `lua/core/` — options, keymaps, autocommands, custom functions
- `lua/plugins/` — one file per plugin group, each returns a lazy.nvim spec table
- `lsp/` — per-server config files (Neovim 0.10+ native `lsp/` directory convention)
- `lua/bufferlabel/` — custom module for toggling buffer filename labels in window headers

## LSP Setup

LSP does **not** use nvim-lspconfig in the main flow. Servers are enabled directly via `vim.lsp.enable()` in `init.lua`, with config files in the `lsp/` directory following Neovim's native convention. Mason handles server installation. The commented-out `lsp.lua` plugin file exists as an alternative approach but is not active.

## Conventions

- **Leader key:** `,` (comma)
- **Tab width:** 2 spaces, expandtab
- **Keybinding namespaces:** `<leader>f` = find/telescope, `<leader>g` = git, `<leader>d` = LSP document, `<leader>e` = edit config files, `<leader>l` = Laravel, `<leader>t` = toggles, `-` = custom functions
- **Plugin specs:** each file in `lua/plugins/` returns a table (or list of tables) for lazy.nvim — follow this pattern when adding plugins
- **Pure Lua:** no vimscript files; vim commands use `vim.cmd()` wrappers when needed

## Adding a New Plugin

Create a file in `lua/plugins/` returning a lazy.nvim spec, then add `require "plugins.<name>"` to the `lazy.setup()` call in `init.lua`.

## Adding a New Language Server

1. Create `lsp/<server_name>.lua` returning the server config table
2. Add the server name to the `vim.lsp.enable()` list in `init.lua`
3. Optionally add it to Mason's `ensure_installed` in `lua/plugins/mason.lua`
