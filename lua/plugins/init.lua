local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require("lazy").setup({
	{ import = "plugins.conform" },
	{ import = "plugins.mason" },
	{ import = "plugins.tokyonight" },
	{ import = "plugins.neo-tree" },
	{ import = "plugins.telescope" },
	{ import = "plugins.autopairs" },
	{ import = "plugins.comment" },
	{ import = "plugins.todo-comments" },
	{ import = "plugins.guess-indent" },
	{ import = "plugins.gitsigns" },
	{ import = "plugins.mini" },
	{ import = "plugins.lualine" },
	{ import = "plugins.which-key" },
}, {
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})

require("plugins.keymaps")

-- setup the colorscheme
require("tokyonight").setup({
	style = "storm", -- seems to set the style for "tokyonight". "moon" or "storm", "night", "day"
	transparent = false,
	terminal_colors = true,
})
vim.cmd.colorscheme("tokyonight")
