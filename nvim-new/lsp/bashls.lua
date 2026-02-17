return {
    cmd = { "bash-language-server", "start" },
    filetypes = { "zsh", "sh", "bash" },
    root_markers = { ".git" },
    init_options = {},
    settings = {
        bashIde = {
            globPattern = "*@(.sh|.inc|.bash|.command)",
        },
    },
}
