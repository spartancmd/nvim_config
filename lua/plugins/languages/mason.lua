return {
    {
        "mason-org/mason.nvim",
        opts = {
            ensure_installed = {
                "clang-format",
            },
        },
        config = function(_, opts)
            require("mason").setup(opts)
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
            ensure_installed = {
                "pyright",
                "lua_ls",
                "ts_ls",
                "clangd",
                "jsonls",
                "marksman",
                "html",
                "cssls",
            },
        },
        config = function(_, opts)
            require("mason-lspconfig").setup(opts)
        end,
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        event = "VeryLazy",
        opts = {
            ensure_installed = {
                "codelldb",
                "python",
            },
            handlers = {
                function(config)
                    require("mason-nvim-dap").default_setup(config)
                end,
            },
        },
    },
}
