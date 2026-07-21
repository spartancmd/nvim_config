return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,

	opts = {
		indent = { enabled = true },
		terminal = { enabled = true },
		statuscolumn = { enabled = true },
		scroll = {
			enabled = true,
			animate = {
				duration = {
					step = 10,
					total = 25,
				},
			},
		},
	},

	keys = {
		{
			"<leader>tf",
			function()
				Snacks.terminal.open(nil, {
					win = {
						position = "float",
						border = "rounded",
					},
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
