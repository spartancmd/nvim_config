return {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
        "mason-org/mason.nvim",
        "neovim/nvim-lspconfig",
    },
    opts = {
        -- NOTE: possible, but better to do it explicitly in lspconfig.lua
        -- automatic_enable = true,
        ensure_installed = {
            "lua_ls",
            "pyright",
            "jdtls",
            "ts_ls",
            "html",
            "cssls",
            "jsonls",
            "yamlls",
            "dockerls",
            "bashls",
            "marksman",
            "taplo",
        },
    },
}
