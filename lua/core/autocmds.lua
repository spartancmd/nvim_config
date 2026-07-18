vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
        local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, {
                buffer = event.buf,
                silent = true,
                desc = desc,
            })
        end

        map("n", "gd", vim.lsp.buf.definition, "Go to definition")
        map("n", "gr", vim.lsp.buf.references, "Show references")
        map("n", "K", vim.lsp.buf.hover, "Hover documentation")
        map("n", "<leader>cn", vim.lsp.buf.rename, "Rename symbol")
        map("n", "<leader>ca", vim.lsp.buf.code_action, "Code actions")
    end,
})
