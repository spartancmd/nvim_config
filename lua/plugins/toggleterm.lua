return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		-- Setup toggleterm
		require("toggleterm").setup({
			direction = "float", -- Default direction
			open_mapping = [[<c-\>]], -- Ctrl+\ to toggle
			shade_terminals = true,
			start_in_insert = true,
			insert_mappings = true,
			persist_mode = true,
		})

		-- Toggleterm terminal instance with PowerShell (float)
		local Terminal = require("toggleterm.terminal").Terminal

		-- Keybindings
		vim.keymap.set("n", "<leader>th", function()
			require("toggleterm").toggle(2, nil, nil, "horizontal")
		end, { desc = "[T]erminal [H]orizontal" })

		vim.keymap.set("n", "<leader>tv", function()
			require("toggleterm").toggle(3, nil, nil, "vertical")
		end, { desc = "[T]erminal [V]ertical" })
	end,
}
