return {
	{
		"echasnovski/mini.nvim",
		config = function()
			-- mini.ai: better text objects selection
			-- NOTE: key binds: va[char] - select around [char]; vi[char] - select inside [char]; yiq - yank (copy) inside quotes ""; ci[char] - change inside [char]
			require("mini.ai").setup({
				n_lines = 500, -- how many lines around cursor to check for text objects
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
			})

			-- mini.statusline: simple statusline with mode, git branch, filename, location

			-- local statusline = require("mini.statusline")
			-- statusline.setup({
			-- 	use_icons = vim.g.have_nerd_font,
			-- })
			--
			-- statusline.section_a = function()
			-- 	return " " .. vim.fn.mode():upper() .. " "
			-- end
			--
			-- statusline.section_b = function()
			-- 	local git_status = vim.b.gitsigns_status or ""
			-- 	if git_status ~= "" then
			-- 		return " " .. git_status .. " "
			-- 	else
			-- 		return ""
			-- 	end
			-- end
			--
			-- statusline.section_c = function()
			-- 	return vim.fn.expand("%:t")
			-- end
			--
			-- statusline.section_location = function()
			-- 	return "%2l:%-2v"
			-- end

			-- mini.indentscope: show indent guides and current scope
			require("mini.indentscope").setup({
				symbol = "│",
				options = { try_as_border = true },
				draw = {
					animation = require("mini.indentscope").gen_animation.linear({
						duration = 5,
						unit = "total",
					}),
				},
			})
		end,
	},
}
