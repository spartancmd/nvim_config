return {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
        local lspconfig = require("lspconfig")

        -- NOTE: if a error/warning message appears twice, try commenting out the lsp server in here
        local servers = {
            clangd = {},
            pyright = {},
            gopls = {},
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

        for name, config in pairs(servers) do
            lspconfig[name].setup(config)
        end
    end,
}
