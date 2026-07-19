return {
    "neovim/nvim-lspconfig",

    config = function()
        local capabilities = require("blink.cmp").get_lsp_capabilities()

        -- configure each server with: 
        -- vim.lsp.config(server_name, config)

        vim.lsp.config("lua_ls", {
            capabilities = capabilities,
            settings = { -- will be passed to lua_ls
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                },
            },
        })
    end,
}
