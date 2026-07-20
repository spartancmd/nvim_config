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
			enabled = true,
		},

		lsp = {
			progress = {
				enabled = false, -- Deaktiviert die ✓pyright Stack-Meldungen unten rechts
			},
		},
	},
}
