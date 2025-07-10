return {
	"numToStr/Comment.nvim",
	event = "VeryLazy", -- Load only when needed (efficient)
	config = function()
		require("Comment").setup()
	end,
}
