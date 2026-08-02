vim.g.mapleader = " "
vim.g.maplocalleader = "," -- local leader for filetype specific keymaps

local function map(mode, lhs, rhs, desc, opts)
	opts = opts or {}
	opts.desc = desc
	opts.silent = true

	vim.keymap.set(mode, lhs, rhs, opts)
end

-- clear search highlights
map("n", "<Esc>", "<cmd>nohlsearch<CR>", "Clear search highlight")

-- window navigation
map("n", "<C-h>", "<C-w>h", "Go to left window")

map("n", "<C-j>", "<C-w>j", "Go to lower window")

map("n", "<C-k>", "<C-w>k", "Go to upper window")

map("n", "<C-l>", "<C-w>l", "Go to right window")

-- window handling
map("n", "<leader>ws", "<cmd>split<CR>", "Horizontal split")

map("n", "<leader>wv", "<cmd>vsplit<CR>", "Vertical split")

map("n", "<leader>wc", "<cmd>close<CR>", "Close window")

map("n", "<leader>wo", "<cmd>only<CR>", "Close other windows")

-- buffer handling
map("n", "<S-l>", "<cmd>bnext<CR>", "Switch to next buffer")

map("n", "<S-h>", "<cmd>bprevious<CR>", "Switch to previous buffer")

map("n", "<leader>bd", "<cmd>bd<CR>", "Delete buffer")

map("n", "<leader>bl", "<cmd>buffers<CR>", "List buffers")
