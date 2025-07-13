return {
	{
		"echasnovski/mini.nvim",
		config = function()
			-- mini.ai: better text objects selection
			-- NOTE: key binds: va[char] - select around [char]; vi[char] - select inside [char]; yiq - yank (copy) inside quotes ""; ci[char] - change inside [char]
			require("mini.ai").setup({
				n_lines = 1000, -- how many lines around cursor to check for text objects
			})

			-- mini.surround: add/change/delete surroundings like quotes, brackets, etc.
			-- NOTE: key-binds: sa[...] - surround add; sr[...] - surround replace; sd[...] - delete surround
			require("mini.surround").setup({
				-- Module mappings. Use `''` (empty string) to disable one.
				mappings = {
					add = "sa", -- Add surrounding in Normal and Visual modes
					delete = "sd", -- Delete surrounding
					find = "sf", -- Find surrounding (to the right)
					find_left = "sF", -- Find surrounding (to the left)
					highlight = "sh", -- Highlight surrounding
					replace = "sr", -- Replace surrounding
					update_n_lines = "sn", -- Update `n_lines`

					suffix_last = "l", -- Suffix to search with "prev" method
					suffix_next = "n", -- Suffix to search with "next" method
				},
				n_lines = 1000,
			})
			require("mini.fuzzy").setup()
		end,
	},
}
