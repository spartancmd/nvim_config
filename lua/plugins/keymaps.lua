-- conform.nvim
-- keymap to manually format
vim.keymap.set({ "n", "v" }, "<leader>f", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "[F]ormat buffer" })

-- Neo-tree
-- keymap to toggle Neo-tree
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle Neo-tree" })

-- telescope
-- Keymaps
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind by [G]rep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind [B]uffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })

-- todo-comments
-- Todo Comments
vim.keymap.set("n", "]t", function()
	require("todo-comments").jump_next()
end, { desc = "Next todo comment" })
vim.keymap.set("n", "[t", function()
	require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

-- gitsigns
-- move switch hunks
vim.keymap.set("n", "]c", function()
	if vim.wo.diff then
		return "]c"
	end
	vim.schedule(function()
		require("gitsigns").next_hunk()
	end)
	return "<Ignore>"
end, { desc = "Next Git Hunk" })

vim.keymap.set("n", "[c", function()
	if vim.wo.diff then
		return "[c"
	end
	vim.schedule(function()
		require("gitsigns").prev_hunk()
	end)
	return "<Ignore>"
end, { desc = "Previous Git Hunk" })

-- operate with hunks

vim.keymap.set({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>", { desc = "Stage Hunk" })
vim.keymap.set({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", { desc = "Reset Hunk" })
vim.keymap.set("n", "<leader>hS", require("gitsigns").stage_buffer, { desc = "Stage Buffer" })
vim.keymap.set("n", "<leader>hu", require("gitsigns").undo_stage_hunk, { desc = "Undo Stage Hunk" })
vim.keymap.set("n", "<leader>hR", require("gitsigns").reset_buffer, { desc = "Reset Buffer" })
vim.keymap.set("n", "<leader>hp", require("gitsigns").preview_hunk, { desc = "Preview Hunk" })
vim.keymap.set("n", "<leader>hb", function()
	require("gitsigns").blame_line({ full = true })
end, { desc = "Blame Line" })
vim.keymap.set("n", "<leader>tb", require("gitsigns").toggle_current_line_blame, { desc = "Toggle Blame" })
vim.keymap.set("n", "<leader>hd", require("gitsigns").diffthis, { desc = "Diff This" })
vim.keymap.set("n", "<leader>hD", function()
	require("gitsigns").diffthis("~")
end, { desc = "Diff This (Against HEAD)" })
vim.keymap.set("n", "<leader>td", require("gitsigns").toggle_deleted, { desc = "Toggle Deleted" })
