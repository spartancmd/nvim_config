return {
	"windwp/nvim-autopairs",
	event = "InsertEnter", -- Load on insert mode
	config = function()
		require("nvim-autopairs").setup({
			check_ts = true, -- Enable Treesitter integration
			fast_wrap = {}, -- Optional: Enable fast wrap using <M-e>
		})
	end,
}
