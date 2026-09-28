--------------------------------------------------------
-- Mason is a package manager for various CLI and
-- server applications that connect to neovim for
-- various LSP, formatting, and other features.
--------------------------------------------------------

return {
    "williamboman/mason.nvim",
    config = function()
        require("mason").setup()

        -- Checks listed packages and installs them
        -- if they are not already:

        local registry = require("mason-registry")

        -- These are package names sourced from the Mason registry,
        -- and may not necessarily match the server names used in lspconfig.
        -- Apply version property if a specific version is desired.
        local ensure_installed = {
            -- LSPs
            { name = "lua-language-server" }, -- lua
            { name = "typescript-language-server" }, -- typescript
            { name = "vue-language-server" },
            { name = "vtsls" },
            { name = "json-lsp" }, -- json
            { name = "yaml-language-server" }, -- yaml
            { name = "html-lsp" }, -- html
            { name = "css-lsp" }, -- css
            { name = "intelephense" }, -- php
            { name = "pyright" }, -- python
            { name = "sqlls" }, -- sql
            { name = "bash-language-server" }, -- bash
            { name = "dockerfile-language-server" }, -- docker
            { name = "docker-compose-language-service" }, -- docker compose

            -- Formatting
            { name = "prettierd" }, -- Formatting for various common filetypes

            -- Linting
            { name = "eslint-lsp" }, -- JS/TS linting
        }

        -- Ensure packages are installed and up to date
        registry.refresh(function()
            for _, package_details in pairs(ensure_installed) do
                local package = registry.get_package(package_details.name)
                local current_version = package:get_installed_version()
                local install_version = package:get_latest_version()
                if package_details.version ~= nil then
                    install_version = package_details.version
                end
                local updated = current_version == install_version
                local installed = registry.is_installed(package_details.name)
                if not installed or not updated then
                    package:install({ version = install_version })
                end
            end
        end)
    end,
}
