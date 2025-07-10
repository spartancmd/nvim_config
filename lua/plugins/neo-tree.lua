return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- optional but recommended
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true,
			enable_git_status = true,
			enable_diagnostics = true,
			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
					hide_gitignored = true,
					hide_by_name = {
						"node_modules",
					},
				},
				follow_current_file = {
					enabled = true,
				},
				hijack_netrw_behavior = "open_default",
			},
			window = {
				position = "left",
				width = 30,
				mappings = {
					["<space>"] = "none",
				},
			},
		})
	end,
}
