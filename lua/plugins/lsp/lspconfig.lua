return {
    "neovim/nvim-lspconfig",

    config = function()
        local capabilities = require("blink.cmp").get_lsp_capabilities()

        -- configure each server with:
        -- vim.lsp.config(server_name, config)
        -- setting = ... will be passed to the language server
        vim.lsp.config("jdtls", {
            capabilities = capabilities,
        })
        vim.lsp.enable("jdtls")

        vim.lsp.config("ts_ls", {
            capabilities = capabilities,
        })
        vim.lsp.enable("ts_ls")

        vim.lsp.config("html", {
            capabilities = capabilities,
        })
        vim.lsp.enable("html")

        vim.lsp.config("cssls", {
            capabilities = capabilities,
        })
        vim.lsp.enable("cssls")

        vim.lsp.config("jsonls", {
            capabilities = capabilities,
        })
        vim.lsp.enable("jsonls")

        vim.lsp.config("yamlls", {
            capabilities = capabilities,
        })
        vim.lsp.enable("yamlls")

        vim.lsp.config("dockerls", {
            capabilities = capabilities,
        })
        vim.lsp.enable("dockerls")

        vim.lsp.config("bashls", {
            capabilities = capabilities,
        })
        vim.lsp.enable("bashls")

        vim.lsp.config("marksman", {
            capabilities = capabilities,
        })
        vim.lsp.enable("marksman")

        vim.lsp.config("taplo", {
            capabilities = capabilities,
        })
        vim.lsp.enable("taplo")

        vim.lsp.config("lua_ls", {
            capabilities = capabilities,
        })
        vim.lsp.enable("lua_ls")

        vim.lsp.config("neocmake", {
            capabilities = capabilities,
        })
        vim.lsp.enable("neocmake")

        -- NOTE: expected clangd to be installed separately
        vim.lsp.config("clangd", {
            capabilities = capabilities,
            cmd = {
                vim.uv.os_uname().sysname == "Windows_NT" and "C:/msys64/ucrt64/bin/clangd.exe" or "clangd",
                "--background-index",
                "--compile-commands-dir=build",
                "--query-driver=C:/msys64/ucrt64/bin/*",
            },
        })
        vim.lsp.enable("clangd")

        vim.lsp.config("pyright", {
            capabilities = capabilities,
        })
        vim.lsp.enable("pyright")
    end,
}
