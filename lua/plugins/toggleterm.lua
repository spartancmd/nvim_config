return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup({
			start_in_insert = true,
			persist_mode = false,
			shade_terminals = true,
			shell = vim.o.shell,
			direction = "horizontal", -- default, can change dynamically
		})

		-- Exit terminal mode
		-- Shared terminal instance
		local Terminal = require("toggleterm.terminal").Terminal
		local shared_term = Terminal:new({
			hidden = true,
			direction = "horizontal",
			float_opts = { border = "curved" },
			on_open = function(term)
				term:change_dir(vim.fn.getcwd()) -- ensure cwd is updated when opened
			end,
		})

		-- Track current direction
		local current_direction = "horizontal"

		-- q to close terminal window (not buffer)
		vim.api.nvim_create_autocmd("TermOpen", {
			pattern = "*",
			callback = function()
				vim.keymap.set("n", "q", function()
					local win = vim.api.nvim_get_current_win()
					vim.api.nvim_win_close(win, false)
				end, { buffer = 0, desc = "Close terminal window with q" })
			end,
		})
	end,
}
