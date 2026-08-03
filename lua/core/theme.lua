local default_theme = "default"
local theme_file = vim.fn.stdpath("data") .. "/last-theme"

local function load_theme(theme)
	local ok = pcall(vim.cmd.colorscheme, theme)

	if not ok then
		vim.notify("Theme '" .. theme .. "' not available. Using " .. default_theme, vim.log.levels.WARN)

		vim.cmd.colorscheme(default_theme)
	end
end

if vim.fn.filereadable(theme_file) == 1 then
	local theme = vim.fn.readfile(theme_file)[1]

	if theme and theme ~= "" then
		load_theme(theme)
	else
		load_theme(default_theme)
	end
else
	load_theme(default_theme)
end
