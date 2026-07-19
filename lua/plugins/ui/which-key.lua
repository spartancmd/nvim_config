return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		spec = {
			{ "<leader>c", group = "Code" },
			{ "<leader>b", group = "Buffer" },
			{ "<leader>f", group = "Find" },
			{ "<leader>g", group = "Git" },
			{ "<leader>r", group = "Rename" },
			{ "<leader>w", group = "Window" },
			{ "<leader>t", group = "Terminal" },
			{ "<leader>x", group = "Diagnostics" },
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
