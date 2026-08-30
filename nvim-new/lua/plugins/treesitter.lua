return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    -- Ensure these parsers are installed
    local parsers = {
      'lua', 'python', 'javascript', 'typescript', 'vimdoc', 'vim',
      'regex', 'terraform', 'sql', 'dockerfile', 'toml', 'json',
      'java', 'groovy', 'go', 'gitignore', 'graphql', 'yaml',
      'make', 'cmake', 'markdown', 'markdown_inline', 'bash',
      'tsx', 'css', 'html', 'vue', 'php',
    }

    local installed = require('nvim-treesitter.config').get_installed()
    local to_install = vim.tbl_filter(function(p)
      return not vim.tbl_contains(installed, p)
    end, parsers)

    if #to_install > 0 then
      require('nvim-treesitter').install(to_install)
    end

    -- Enable treesitter-based highlighting for all buffers
    vim.api.nvim_create_autocmd('FileType', {
      callback = function(args)
        pcall(vim.treesitter.start, args.buf)
      end,
    })
  end,
}
