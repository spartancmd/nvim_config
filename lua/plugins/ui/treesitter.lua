return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"lua",
			"vim",
			"vimdoc",
			"markdown",
			"markdown_inline",
			"c",
			"cpp",
			"python",
			"json",
			"html",
			"css",
			"javascript",
			"typescript",
			"tsx",
			"cmake",
		},

		highlight = {
			enable = true,
		},

		indent = {
			enable = true,
		},

		incremental_selection = {
			enable = true,
		},
	},
}
