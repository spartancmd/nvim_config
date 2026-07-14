local opt = vim.opt

-- line numbers
opt.number = true
opt.relativenumber = true

opt.signcolumn = "yes" -- reserves space left to line number for characters from e.g. gitsigns

-- tabulation
opt.expandtab = true -- converts tab-press into spaces
opt.shiftwidth = 4  -- number of spaces for each indentation
opt.tabstop = 4 -- width of a \t character
opt.smartindent = true -- auto indentation when new line

-- search 
opt.ignorecase = true -- ignore case while searching
opt.smartcase = true -- when at least one capital, case no longer ignored

-- view
opt.wrap = false -- long lines stay on one line and require horizontal scrolling
opt.cursorline = true -- highlight current line
opt.termguicolors = true -- enables more colors (24-bit RGB), good for modern themes
opt.updatetime = 250 -- standard 4000ms

-- window
opt.splitbelow = true -- new horizontal window opens below
opt.splitright = true -- new vertical window opens right

-- scroll
opt.scrolloff = 8 -- guarantees at least 8 lines above and below the cursor

-- mouse
opt.mouse = "a" -- full mouse handling by neovim

-- clipboard
opt.clipboard = "unnamedplus" -- connects to the system clipboard

-- undo files
opt.undofile = true -- file history doesnt get lost after closing the file
