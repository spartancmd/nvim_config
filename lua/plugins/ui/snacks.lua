return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,

	opts = {
		indent = { enabled = true },
		terminal = { enabled = true }, -- NOTE: use terminal for small things. It's better rather not to to fit with neovim workflow
		statuscolumn = { enabled = true },
		scroll = { enabled = true },
	},

	keys = {
		{
			"<leader>tf",
			function()
				Snacks.terminal.open(nil, {
					win = { position = "float" },
				})
			end,
			desc = "Floating terminal",
		},
		{
			"<leader>tt",
			function()
				Snacks.terminal.open(nil, {
					win = { position = "bottom" },
				})
			end,
			desc = "Horizontal terminal",
		},
		{
			"<leader>tv",
			function()
				Snacks.terminal.open(nil, {
					win = { position = "right" },
				})
			end,
			desc = "Vertical terminal",
		},
	},
}
