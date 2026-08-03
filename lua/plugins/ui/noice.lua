return {
	"folke/noice.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	event = "VeryLazy",

	opts = {
		-- additional popups, upper right
		messages = {
			enabled = false,
		},

		-- deactivates progress lines bottom right
		lsp = {
			progress = {
				enabled = false,
			},
		},
	},
}
