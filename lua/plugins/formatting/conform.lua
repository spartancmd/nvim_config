return {
	"stevearc/conform.nvim",

	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format()
			end,
			desc = "Format buffer",
		},
	},

	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
		},

		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
