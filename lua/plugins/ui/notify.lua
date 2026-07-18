return {
	"rcarriga/nvim-notify",

	opts = {
		timeout = 3000,
	},

	config = function(_, opts)
		local notify = require("notify")
		notify.setup(opts)

		vim.notify = notify
	end,
}
