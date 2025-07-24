return {
    {
        "stevearc/conform.nvim",
        opts = {
            format_on_save = {
                lsp_fallback = true,
                timeout_ms = 500,
            },
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "black" },
                c = { "clang_format" },
                cpp = { "clang_format" },
                go = { "gofmt" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                html = { "prettier" },
                css = { "prettier" },
                json = { "jq" },
                markdown = { "prettier" },
            },
            formatters = {
                -- should work without it
                -- clang_format = {
                -- 	prepend_args = { '--style=file', '--fallback-style=LLVM' },
                -- },
            }
        },
        config = function(_, opts)
            require("conform").setup(opts)
        end,
    },
}
