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

		-- Debug configurations for each language.
		-- For each language: which adapter and how to start a debug session
		dap.configurations.cpp = {
			{
				name = "Launch", -- name of the configuration
				type = "codelldb", -- adapter
				request = "launch", -- "launch" starts a new process, "attach" connects to an existing one
				program = function()
					-- user input
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/build/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false, -- stop when entering main
			},
		}

		dap.configurations.c = dap.configurations.cpp

		dap.configurations.python = {
			{
				name = "Launch file",
				type = "python",
				request = "launch",
				program = "${file}",
				cwd = "${workspaceFolder}",
				console = "internalConsole",
				justMyCode = true,
			},
		}
	end,
}
