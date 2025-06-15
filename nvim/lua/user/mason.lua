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

  ["tsserver"] = function()
    local lspconfig = require("lspconfig")
    lspconfig.tsserver.setup {
      init_options = {
        plugins = {
          {
            name = '@vue/typescript-plugin',
            location = '/path/to/@vue/language-server',
            languages = { 'vue' },
          }
        }
      }
    }
  end,

  ["volar"] = function()
    local lspconfig = require("lspconfig")
    lspconfig.volar.setup {
      init_options = {
        vue = {
          hybridMode = false,
        }
      }
    }
  end,





  --[[ ["eslint"] = function() ]]
  --[[   local lspconfig = require("lspconfig") ]]
  --[[   local latestNodeVersion = 'v16.20.2' ]]
  --[[   local homeDir = '/home/zord' ]]
  --[[   local capabilities = vim.lsp.protocol.make_client_capabilities() ]]
  --[[   capabilities.textDocument.completion.completionItem.snippetSupport = true ]]
  --[[]]
  --[[   lspconfig.eslint.setup { ]]
		--[[ 		root_dir = function(fname) ]]
		--[[ 			return require('lspconfig').util.find_git_ancestor(fname) ]]
		--[[ 		end, ]]
  --[[       capabilities = capabilities, ]]
		--[[ 		filetypes = { 'javascript', 'javascriptreact', 'vue' }, ]]
		--[[ 		settings = { ]]
		--[[ 			debug = true, ]]
		--[[ 			rootMarkers = { '.git/' }, ]]
		--[[ 			workingDirectory = { mode = 'auto' }, ]]
		--[[ 			nodePath = homeDir .. '/.nvm/versions/node/' .. latestNodeVersion .. '/lib/node_modules/' ]]
		--[[ 		}, ]]
		--[[ 		libs = { homeDir .. '/.nvm/versions/node/' .. latestNodeVersion .. '/lib/node_modules/' }, ]]
		--[[ 	} ]]
  --[[ end, ]]

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
  end,
}
