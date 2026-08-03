return {
	"rcarriga/nvim-notify",

	opts = {
		timeout = 3000,
		time_formats = {
			notification = "%H:%M",
			notification_history = "%FT%T",
		},
	},

	config = function(_, opts)
		local notify = require("notify")
		notify.setup(opts)

		vim.notify = notify
	end,
}
