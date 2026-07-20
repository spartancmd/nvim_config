return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,

	opts = {
		flavour = "mocha", -- latte, frappe, macchiato, mocha
		transparent_background = true,
		term_colors = false,
		no_italic = false, -- Force no italic
		no_bold = false, -- Force no bold
		no_underline = false, -- Force no underline
		styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
			comments = { "italic" }, -- Change the style of comments
			conditionals = { "italic" },
			loops = {},
			functions = {},
			keywords = {},
			strings = {},
			variables = {},
			numbers = {},
			booleans = {},
			properties = {},
			types = {},
			operators = {},
			-- miscs = {}, -- Uncomment to turn off hard-coded styles
		},
	},
}
