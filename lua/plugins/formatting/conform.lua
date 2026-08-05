return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },

    keys = {
        {
            "<leader>cf",
            function()
                require("conform").format({
                    async = true,
                    lsp_format = "fallback",
                })
            end,
            desc = "Format buffer",
        },
    },

    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            cpp = { "clang-format" },
            c = { "clang-format" },
            cmake = { "gersemi" },
            python = { "ruff_format" },

            java = { "clang-format" },
            javascript = { "prettier" },
            typescript = { "prettier" },
            javascriptreact = { "prettier" },
            typescriptreact = { "prettier" },
            html = { "prettier" },
            css = { "prettier" },
            json = { "prettier" },
            yaml = { "prettier" },
            markdown = { "prettier" },
            sql = { "sql_formatter" },
        },

        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback",
        },
    },
}
