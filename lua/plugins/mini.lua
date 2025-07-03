return { -- Collection of various small independent plugins/modules
	"echasnovski/mini.nvim",
	config = function()
		-- Better Around/Inside textobjects
		--
		-- Examples:
		--  - va)  - [V]isually select [A]round [)]paren
		--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
		--  - ci'  - [C]hange [I]nside [']quote
		require("mini.ai").setup({ n_lines = 500 })

		-- Add/delete/replace surroundings (brackets, quotes, etc.)
		--
		-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
		-- - sd'   - [S]urround [D]elete [']quotes
		-- - sr)'  - [S]urround [R]eplace [)] [']

		local mini_surround = require("mini.surround")

		mini_surround.setup()

		-- Add surround: <leader>sa
		vim.keymap.set("n", "<leader>sa", function()
			mini_surround.add()
		end, { desc = "Add Surround" })

		-- Delete surround: <leader>sd
		vim.keymap.set("n", "<leader>sd", function()
			mini_surround.delete()
		end, { desc = "Delete Surround" })

		-- Replace surround: <leader>sr
		vim.keymap.set("n", "<leader>sr", function()
			mini_surround.replace()
		end, { desc = "Replace Surround" })

		-- Simple and easy statusline.
		--  You could remove this setup call if you don't like it,
		--  and try some other statusline plugin
		statusline = require("mini.statusline")

		statusline.setup({
			use_icons = vim.g.have_nerd_font,
		})

		-- Mode (e.g. NORMAL, INSERT)
		statusline.section_a = function()
			return " " .. vim.fn.mode():upper() .. " "
		end

		-- Git branch, using gitsigns info if available
		statusline.section_b = function()
			local git_status = vim.b.gitsigns_status or ""
			-- git_status looks like: " branch_name +1 ~0 -0"
			if git_status ~= "" then
				return " " .. git_status .. " "
			else
				return ""
			end
		end

		-- Filename
		statusline.section_c = function()
			return vim.fn.expand("%:t")
		end

		-- Line:Column
		statusline.section_location = function()
			return "%l:%c"
		end -- You can configure sections in the statusline by overriding their
		-- default behavior. For example, here we set the section for
		-- cursor location to LINE:COLUMN
		---@diagnostic disable-next-line: duplicate-set-field
		statusline.section_location = function()
			return "%2l:%-2v"
		end

		-- ... and there is more!
		--  Check out: https://github.com/echasnovski/mini.nvim
	end,
}
