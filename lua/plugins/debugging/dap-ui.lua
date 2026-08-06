return {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        "mfussenegger/nvim-dap",
        "nvim-neotest/nvim-nio",
    },
    keys = {
        {
            "<leader>dv",
            function()
                require("dapui").toggle()
            end,
            desc = "Toggle debug ui",
        },
    },
    opts = {},
}
