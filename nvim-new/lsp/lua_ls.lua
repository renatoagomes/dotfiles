return {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = {
        ".luarc.json",
        ".luarc.jsonc",
        ".luacheckrc",
        ".stylua.toml",
        "stylua.toml",
        "selene.toml",
        "selene.yml",
        ".git",
    },
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = { "vim", "Snacks" },
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                    -- Depending on the usage, you might want to add additional paths here.
                    vim.fn.expand("$VIMRUNTIME/lua"),
                    -- vim.fn.stdpath("config") .. "/lua",
                    vim.fn.stdpath("config"),
                    vim.fn.stdpath("data") .. "/lazy", -- Lazy plugin directory
                },
            },
            telemetry = {
                enable = false,
            },
        },
    },
}
