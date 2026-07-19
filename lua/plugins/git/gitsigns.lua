return {
	"lewis6991/gitsigns.nvim",

    event = "VeryLazy",

	keys = {
		-- navigation
		{
			"]h",
			function()
				require("gitsigns").next_hunk()
			end,
			desc = "Next hunk",
		},
		{
			"[h",
			function()
				require("gitsigns").prev_hunk()
			end,
			desc = "Previous hunk",
		},

		-- git actions
		{
			"<leader>gp",
			function()
				require("gitsigns").preview_hunk()
			end,
			desc = "Preview hunk",
		},
	},

	opts = {
		signs = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
		},

        current_line_blame = true,

        current_line_blame_opts = {
            delay = 350,
            virt_text_pos = "eol",
        },
	},
}
