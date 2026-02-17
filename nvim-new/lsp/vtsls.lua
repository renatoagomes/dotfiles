local vue_language_server_path = vim.fn.stdpath("data")
    .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"
-- local vue_plugin_path = "/opt/homebrew/lib/node_modules/@vue/typescript-plugin"

local vue_plugin = {
    name = "@vue/typescript-plugin",
    location = vue_language_server_path,
    languages = { "vue" },
    configNamespace = "typescript",
    enableForWorkspaceTypeScriptVersions = true,
}

return {
    cmd = { "vtsls", "--stdio" },
    filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
    root_markers = { "package.json", "tsconfig.json" },
    settings = {
        vtsls = {
            enableMoveToFileCodeAction = true,
            autoUseWorkspaceTsdk = true,
            experimental = {
                completion = {
                    enableServerSideFuzzyMatch = true,
                },
            },
            tsserver = {
                globalPlugins = {
                    vue_plugin,
                },
            },
        },
        typescript = {
            updateImportsOnFileMove = { enabled = "always" },
            suggest = {
                completeFunctionCalls = true,
            },
            inlayHints = {
                enumMemberValues = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                parameterNames = { enabled = "all" },
                parameterTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                variableTypes = { enabled = false },
            },
            tsserver = {
                maxTsServerMemory = 8192,
            },
        },
    },
}
