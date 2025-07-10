return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6", -- Or use the latest stable release
	dependencies = {
		"nvim-lua/plenary.nvim", -- Required
		"nvim-telescope/telescope-fzf-native.nvim", -- Optional, better sorting
		build = "make",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<esc><esc>"] = actions.close,
					},
				},
				layout_strategy = "horizontal",
				layout_config = {
					preview_width = 0.6,
				},
			},
			pickers = {
				find_files = { hidden = true },
			},
		})

		telescope.load_extension("fzf") -- Load FZF extension if installed
	end,
}
