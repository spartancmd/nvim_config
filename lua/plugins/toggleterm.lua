return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup({
			start_in_insert = true,
			persist_mode = false,
			shade_terminals = true,
			shell = vim.o.shell,
			direction = "horizontal", -- default
		})

		-- Exit terminal mode
		vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

		-- Window navigation in terminal mode
		vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]])
		vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]])
		vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]])
		vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]])

		-- Terminal object
		local Terminal = require("toggleterm.terminal").Terminal

		local term_horizontal = Terminal:new({ direction = "horizontal", hidden = true })
		local term_vertical = Terminal:new({ direction = "vertical", hidden = true })
		local term_float = Terminal:new({
			direction = "float",
			hidden = true,
			float_opts = { border = "curved" },
		})

		function _TOGGLE_TERM_HORIZONTAL()
			term_horizontal:toggle()
		end
		function _TOGGLE_TERM_VERTICAL()
			term_vertical:toggle()
		end
		function _TOGGLE_TERM_FLOAT()
			term_float:toggle()
		end

		-- Hide/close terminal when pressing `q` in terminal-normal mode
		vim.api.nvim_create_autocmd("TermOpen", {
			pattern = "*",
			callback = function()
				vim.keymap.set("n", "q", function()
					local win = vim.api.nvim_get_current_win()
					vim.api.nvim_win_close(win, false)
				end, { buffer = 0, desc = "Close terminal window with q" })
			end,
		})

		-- Kill any terminal buffer
		function _KILL_TERMINAL()
			local terms = { term_horizontal, term_vertical, term_float }
			for _, t in ipairs(terms) do
				local bufnr = t.bufnr
				if bufnr and vim.api.nvim_buf_is_valid(bufnr) then
					vim.api.nvim_buf_delete(bufnr, { force = true })
				end
			end
		end

		-- Keymaps (your "buttons")
		vim.keymap.set("n", "<leader>th", _TOGGLE_TERM_HORIZONTAL, { desc = "Toggle Horizontal Terminal" })
		vim.keymap.set("n", "<leader>tv", _TOGGLE_TERM_VERTICAL, { desc = "Toggle Vertical Terminal" })
		vim.keymap.set("n", "<leader>tf", _TOGGLE_TERM_FLOAT, { desc = "Toggle Floating Terminal" })
		vim.keymap.set("n", "<leader>tk", _KILL_TERMINAL, { desc = "Kill Terminal Buffer" })
	end,
}
