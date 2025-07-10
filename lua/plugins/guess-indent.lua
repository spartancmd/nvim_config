return {
	"nmac427/guess-indent.nvim",
	event = "BufReadPost", -- optional: lazy-load when file is opened
	config = function()
		require("guess-indent").setup({})
	end,
}
