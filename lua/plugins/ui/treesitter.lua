return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    opts = {
        ensure_installed = {
            "lua",
            "vim",
            "vimdoc",
            "markdown",
            "markdown_inline",
            "c",
            "cpp",
            "python",
            "json",
            "html",
            "css",
            "javascript",
            "typescript",
            "tsx",
            "yaml",
            "toml",
            "bash",
            "dockerfile",
            "sql",
            "cmake",
            "regex",
            "java",
        },

        highlight = {
            enable = true,
        },

        indent = {
            enable = true,
        },
    },
}
