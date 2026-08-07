if vim.g.vscode then
    vim.g.mapleader = " "
    vim.g.maplocalleader = ","
    vim.opt.clipboard = "unnamedplus"

    vim.keymap.set("n", "<leader>cn", function()
        vim.fn.VSCodeNotify("editor.action.rename")
    end)
    vim.keymap.set("n", "K", function()
        vim.fn.VSCodeNotify("editor.action.showHover")
    end)
    vim.keymap.set("n", "<leader>cf", function()
        vim.fn.VSCodeNotify("editor.action.formatDocument")
    end)

    require("core.lazy")

    return
end

require("core")
