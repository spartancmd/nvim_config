-- See `:help gitsigns` to understand what the configuration keys do
return { -- Adds git related signs to the gutter, as well as utilities for managing changes
	"lewis6991/gitsigns.nvim",

	opts = {
		signs = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
		},

		-- Keymaps for gitsigns
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- Navigate between hunks
			map("n", "]c", function()
				if vim.wo.diff then
					return "]c"
				end
				vim.schedule(function()
					gs.next_hunk()
				end)
				return "<Ignore>"
			end, { expr = true })

			map("n", "[c", function()
				if vim.wo.diff then
					return "[c"
				end
				vim.schedule(function()
					gs.prev_hunk()
				end)
				return "<Ignore>"
			end, { expr = true })

			-- Stage and reset hunks
			map("n", "<leader>hs", gs.stage_hunk) -- Stage current hunk
			map("n", "<leader>hr", gs.reset_hunk) -- Reset current hunk

			-- Preview hunk in a popup window
			map("n", "<leader>hp", gs.preview_hunk)

			-- Show blame info for current line
			map("n", "<leader>hb", function()
				gs.blame_line({ full = true })
			end)

			-- Toggle deleted lines
			map("n", "<leader>td", gs.toggle_deleted)
		end,
	},
}
