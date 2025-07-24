return {
	{
		"stevearc/conform.nvim",
		opts = {
			format_on_save = {
				lsp_fallback = true,
				timeout_ms = 500,
			},
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				-- go = { "gofmt" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				json = { "jq" },
				markdown = { "prettier" },
			},
		},
		config = function(_, opts)
			require("conform").setup(opts)
		end,
	},
}
