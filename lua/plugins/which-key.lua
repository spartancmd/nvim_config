return {
	"folke/which-key.nvim",
	event = "VeryLazy", -- load only when needed
	config = function()
		require("which-key").setup({
			plugins = {
				spelling = { enabled = true },
			},
			window = {
				border = "single",
				position = "bottom",
			},
			layout = {
				spacing = 6,
			},
		})

		-- Optionally register some groups
		local wk = require("which-key")
		wk.register({
			["<leader>f"] = { name = "[F]ind", _ = "which_key_ignore" },
			["<leader>g"] = { name = "[G]it", _ = "which_key_ignore" },
			["<leader>t"] = { name = "[T]erminal / [T]odo", _ = "which_key_ignore" },
			["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
		})
	end,
}
