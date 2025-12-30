return {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
        local servers = {
            clangd = {},
            pyright = {},
            lua_ls = {
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                        workspace = { checkThirdParty = false },
                    },
                },
            },
            ts_ls = {},
            html = {},
            cssls = {},
            jsonls = {},
            marksman = {},
        }

        for name, opts in pairs(servers) do
            vim.lsp.config(name, opts)
            vim.lsp.enable(name)
        end
    end,
}
