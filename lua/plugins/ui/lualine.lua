return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			globalstatus = true,
			theme = "auto",
			component_separators = { left = "\u{e0b9}", right = "\u{e0bf}" },
			section_separators = { left = "\u{e0b8}", right = "\u{e0be}" },
		},
		sections = {
			lualine_a = { { icon = "", "mode" } },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = { "filename" },
			lualine_x = { "filetype" },
			lualine_y = { "lsp_status" },
			lualine_z = { "location" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
	},

	config = function(_, opts)
		require("lualine").setup(opts)
		vim.o.showmode = false
	end,
}
