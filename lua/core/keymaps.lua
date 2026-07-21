local map = vim.keymap

vim.g.mapleader = " "
vim.g.maplocalleader = "," -- local leader for filetype specific keymaps

-- clear search highlights
map.set("n", "<Esc>", "<cmd>nohlsearch<CR>", {
	desc = "Clear search highlight",
	silent = true,
})

-- window navigation
map.set("n", "<C-h>", "<C-w>h", {
	desc = "Go to left window",
	silent = true,
})

map.set("n", "<C-j>", "<C-w>j", {
	desc = "Go to lower window",
	silent = true,
})

map.set("n", "<C-k>", "<C-w>k", {
	desc = "Go to upper window",
	silent = true,
})

map.set("n", "<C-l>", "<C-w>l", {
	desc = "Go to right window",
	silent = true,
})

-- window handling
map.set("n", "<leader>ws", "<cmd>split<CR>", {
	desc = "Horizontal split",
	silent = true,
})

map.set("n", "<leader>wv", "<cmd>vsplit<CR>", {
	desc = "Vertical split",
	silent = true,
})

map.set("n", "<leader>wc", "<cmd>close<CR>", {
	desc = "Close window",
	silent = true,
})

map.set("n", "<leader>wo", "<cmd>only<CR>", {
	desc = "Close other windows",
	silent = true,
})

-- buffer handling
map.set("n", "<S-l>", "<cmd>bnext<CR>", {
	desc = "Switch to next buffer",
	silent = true,
})

map.set("n", "<S-h>", "<cmd>bprevious<CR>", {
	desc = "Switch to previous buffer",
	silent = true,
})

map.set("n", "<leader>bd", "<cmd>bd<CR>", {
	desc = "Delete buffer",
	silent = true,
})

map.set("n", "<leader>bl", "<cmd>buffers<CR>", {
	desc = "List buffers",
	silent = true,
})

vim.keymap.set("n", "<F12>", function()
	require("dap").terminate()
end)
