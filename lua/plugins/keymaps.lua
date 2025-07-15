-- conform.nvim
-- keymap to manually format
vim.keymap.set({ "n", "v" }, "<leader>fm", function()
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
vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "[F]ind [R]ecent" })


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

-- lsp
-- display information about the symbol under the cursor in a windown. Press 2 times to jump into that window
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

-- debugger
local dap = require("dap")
vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, {})
vim.keymap.set("n", "<Leader>dc", dap.continue, {})

-- nvim-ufo
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

-- toggleterm
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- Window navigation in terminal mode
vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]])
vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]])
vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]])
vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]])

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

local function toggle_shared_terminal(direction)
	if direction and current_direction ~= direction then
		-- Change terminal direction on the fly
		shared_term:close()
		shared_term.direction = direction
		current_direction = direction
	end
	shared_term:toggle()
end

-- Keymaps to toggle views
vim.keymap.set("n", "<leader>tt", function()
	toggle_shared_terminal()
end, { desc = "Toggle Terminal" })
vim.keymap.set("n", "<leader>th", function()
	toggle_shared_terminal("horizontal")
end, { desc = "Terminal Horizontal" })
vim.keymap.set("n", "<leader>tv", function()
	toggle_shared_terminal("vertical")
end, { desc = "Terminal Vertical" })
vim.keymap.set("n", "<leader>tf", function()
	toggle_shared_terminal("float")
end, { desc = "Terminal Float" })

-- Kill terminal buffer
vim.keymap.set("n", "<leader>tk", function()
	local bufnr = shared_term.bufnr
	if bufnr and vim.api.nvim_buf_is_valid(bufnr) then
		vim.api.nvim_buf_delete(bufnr, { force = true })
		shared_term.bufnr = nil
	end
end, { desc = "Kill Terminal Buffer" })
