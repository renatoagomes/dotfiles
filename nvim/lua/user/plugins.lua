local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use { "wbthomason/packer.nvim" }
  use { "nvim-lua/plenary.nvim" } -- Useful lua functions used by lots of plugins
  use { "windwp/nvim-autopairs" } -- Autopairs, integrates with both cmp and treesitter
  use { "numToStr/Comment.nvim" }
  use { "JoosepAlviste/nvim-ts-context-commentstring" }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }
  use { "akinsho/bufferline.nvim" }
  use { "moll/vim-bbye" }
  use { "nvim-lualine/lualine.nvim" }
  use { "akinsho/toggleterm.nvim" }
  use { "ahmedkhalf/project.nvim" }
  use { "lewis6991/impatient.nvim" }
  -- use { "lukas-reineke/indent-blankline.nvim" }
  use { "goolord/alpha-nvim" }

  --  which key
  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  -- Colorschemes
  use { "folke/tokyonight.nvim" }
  use { "olimorris/onedarkpro.nvim" }
  use { "lunarvim/darkplus.nvim", commit = "2584cdeefc078351a79073322eb7f14d7fbb1835" }
  use 'w0ng/vim-hybrid'
  use 'nanotech/jellybeans.vim'

  -- cmp plugins
  use { "hrsh7th/nvim-cmp" }         -- The completion plugin
  use { "hrsh7th/cmp-buffer" }       -- buffer completions
  use { "hrsh7th/cmp-path" }         -- path completions
  use { "saadparwaiz1/cmp_luasnip" } -- snippet completions
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "hrsh7th/cmp-nvim-lua" }

  use 'tpope/vim-fugitive'

  -- Snippets snippets
  use { "L3MON4D3/LuaSnip" } --snippet engine
  use { 'mattn/emmet-vim' }
  use 'SirVer/ultisnips'

  -- Php docblock generation
  use 'tobyS/vmustache'
  use 'tobyS/pdv'

  -- blade support
  use 'jwalton512/vim-blade'

  -- Mason and LSP
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }

  --[[ use { "williamboman/nvim-lsp-installer" } -- simple to use language server installer ]]


  use { "jose-elias-alvarez/null-ls.nvim" } -- for formatters and linters

  -- Copilot
  use { "github/copilot.vim" }

  -- Telescope
  use { "nvim-telescope/telescope.nvim" }

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter" }

  -- DAP debug
  -- use { "mfussenegger/nvim-dap", commit = "014ebd53612cfd42ac8c131e6cec7c194572f21d" }
  -- use { "rcarriga/nvim-dap-ui", commit = "d76d6594374fb54abf2d94d6a320f3fd6e9bb2f7" }
  -- use { "ravenxrz/DAPInstall.nvim", commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de" }
  -- use "nvim-telescope/telescope-dap.nvim"

  -- Floating terminal
  use 'voldikss/vim-floaterm'

  -- Vim wiki
  use 'vimwiki/vimwiki'

  -- Multicursor
  use 'mg979/vim-visual-multi'

  -- Better wildmenu completion
  use 'gelguy/wilder.nvim'

  -- Tagbar (show buffer tags to navigate) <leader>tb
  --[[ use 'preservim/tagbar' ]]

  -- Editorconfig
  use 'editorconfig/editorconfig-vim'

  -- Log syntax highlight
  use 'mtdl9/vim-log-highlighting'

  -- better folding
  use {
    "kevinhwang91/nvim-ufo",
    requires = {
      "kevinhwang91/promise-async",
      {
        "luukvbaal/statuscol.nvim",
        config = function()
          local builtin = require("statuscol.builtin")
          require("statuscol").setup(
            {
              relculright = true,
              segments = {
                { text = { " %s ", " " },           click = "v:lua.ScSa" },
                { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
                { text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" }
              }
            }
          )
        end
      }
    }
  }

  -- GitSigns
  use 'lewis6991/gitsigns.nvim'


  --[[ ChatGPT ]]
  --[[ use({ ]]
  --[[   "jackMort/ChatGPT.nvim", ]]
  --[[   config = function() ]]
  --[[     require("chatgpt").setup({ ]]
  --[[       api_key_cmd = 'secret-tool lookup openai neovim', ]]
  --[[     }) ]]
  --[[   end, ]]
  --[[   requires = { ]]
  --[[     "MunifTanjim/nui.nvim", ]]
  --[[     "nvim-lua/plenary.nvim", ]]
  --[[     "nvim-telescope/telescope.nvim" ]]
  --[[   } ]]
  --[[ }) ]]

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
