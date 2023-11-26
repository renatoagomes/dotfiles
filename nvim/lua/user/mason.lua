require("mason").setup({ ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

require('mason-lspconfig').setup()

require("mason-lspconfig").setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup {}
  end,

  -- Next, you can provide a dedicated handler for specific servers.
  ["lua_ls"] = function()
    local lspconfig = require("lspconfig")
    lspconfig.lua_ls.setup {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" }
          }
        }
      }
    }
  end,

  ["eslint"] = function()
    local lspconfig = require("lspconfig")
    lspconfig.eslint.setup {
      default_config = {
        cmd = { 'eslint' },
        filetypes = { 'js' },
        root_dir = function(fname)
          return vim.loop.cwd()
        end,
      },
    }
  end,
  
  ["intelephense"] = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    local lspconfig = require("lspconfig")
    lspconfig.intelephense.setup({

      --[[ handlers = { ]]
      --[[   ["textDocument/publishDiagnostics"] = vim.lsp.with( ]]
      --[[     vim.lsp.diagnostic.on_publish_diagnostics, { ]]
      --[[       -- Disable virtual_text ]]
      --[[       virtual_text = false ]]
      --[[     } ]]
      --[[   ), ]]
      --[[ }, ]]
      default_config = {
        cmd = { 'intelephense', '--stdio' },
        filetypes = { 'php' },
        root_dir = function(fname)
          return vim.loop.cwd()
        end,
      },

      settings = {
        intelephense = {
          stubs = {
            "bcmath",
            "bz2",
            "Core",
            "curl",
            "date",
            "dom",
            "fileinfo",
            "filter",
            "gd",
            "gettext",
            "hash",
            "iconv",
            "imap",
            "intl",
            "json",
            "libxml",
            "mbstring",
            "mcrypt",
            "mysql",
            "mysqli",
            "password",
            "pcntl",
            "pcre",
            "PDO",
            "pdo_mysql",
            "Phar",
            "readline",
            "regex",
            "session",
            "SimpleXML",
            "sockets",
            "sodium",
            "standard",
            "superglobals",
            "tokenizer",
            "xml",
            "xdebug",
            "xmlreader",
            "xmlwriter",
            "yaml",
            "zip",
            "zlib",
            "wordpress-stubs",
            "woocommerce-stubs",
            "acf-pro-stubs",
            "wordpress-globals",
            "wp-cli-stubs",
            "genesis-stubs",
            "polylang-stubs"
          },
          --[[ environment = { ]]
          --[[   includePaths = { '/home/zord/.composer/vendor/php-stubs/', '/home/mte90/.composer/vendor/wpsyntex/' } ]]
          --[[ }, ]]
          files = {
            maxSize = 5000000,
          },
        },
      },
      capabilities = capabilities,
    });
  end

}

