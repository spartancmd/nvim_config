return {
    "mfussenegger/nvim-dap",
    keys = {
        {
            "<leader>ds",
            function()
                require("dap").continue()
            end,
            desc = "Continue / Start",
        },
        {
            "<up>",
            function()
                local dap = require("dap")

                if dap.session() then
                    dap.step_back()
                end
            end,
            desc = "Step back",
        },
        {
            "<down>",
            function()
                local dap = require("dap")

                if dap.session() then
                    dap.step_over()
                end
            end,
            desc = "Step over",
        },
        {
            "<right>",
            function()
                local dap = require("dap")

                if dap.session() then
                    dap.step_into()
                end
            end,
            desc = "Step into",
        },
        {
            "<left>",
            function()
                local dap = require("dap")

                if dap.session() then
                    dap.step_out()
                end
            end,
            desc = "Step out",
        },
        {
            "<leader>db",
            function()
                require("dap").toggle_breakpoint()
            end,
            desc = "Toggle breakpoint",
        },
        {
            "<leader>dq",
            function()
                require("dap").terminate()
            end,
            desc = "Stop debugging",
        },
    },

    config = function()
        local dap = require("dap")

        vim.fn.sign_define("DapBreakpoint", {
            text = "●",
            texthl = "DiagnosticSignError",
        })

        vim.fn.sign_define("DapBreakpointCondition", {
            text = "◆",
            texthl = "DiagnosticSignWarn",
        })

        vim.fn.sign_define("DapLogPoint", {
            text = "◉",
            texthl = "DiagnosticSignInfo",
        })

        vim.fn.sign_define("DapStopped", {
            text = "▶",
            texthl = "DiagnosticSignHint",
            linehl = "Visual",
            numhl = "",
        })
    end,
}
