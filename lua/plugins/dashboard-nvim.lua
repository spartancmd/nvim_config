return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("dashboard").setup({
			theme = "hyper",
			config = {
				header = {
					[[ _________  ________  ___  __        ___    ___ ________  ________   ___  ________  ___  ___  _________   ]],
					[[|\___   ___\\   __  \|\  \|\  \     |\  \  /  /|\   __  \|\   ___  \|\  \|\   ____\|\  \|\  \|\___   ___\ ]],
					[[\|___ \  \_\ \  \|\  \ \  \/  /|_   \ \  \/  / | \  \|\  \ \  \\ \  \ \  \ \  \___|\ \  \\\  \|___ \  \_| ]],
					[[     \ \  \ \ \  \\\  \ \   ___  \   \ \    / / \ \  \\\  \ \  \\ \  \ \  \ \  \  __\ \   __  \   \ \  \  ]],
					[[      \ \  \ \ \  \\\  \ \  \\ \  \   \/  /  /   \ \  \\\  \ \  \\ \  \ \  \ \  \|\  \ \  \ \  \   \ \  \ ]],
					[[       \ \__\ \ \_______\ \__\\ \__\__/  / /      \ \_______\ \__\\ \__\ \__\ \_______\ \__\ \__\   \ \__\]],
					[[        \|__|  \|_______|\|__| \|__|\___/ /        \|_______|\|__| \|__|\|__|\|_______|\|__|\|__|    \|__|]],
					[[                                   \|___|/                                                                ]],
					[[                                                                                                          ]],
				},
				week_header = { enable = false, concat = " – Have a great week!" },
				shortcut = {
					{ desc = "󰈞 Find File", group = "@variable", action = "Telescope find_files", key = "f" },
					{ desc = "  New File       ", group = "@constant", action = "enew", key = "n" },
					{ desc = " Live Grep", group = "@variable", action = "Telescope live_grep", key = "g" },
					{ desc = " Recent Files", group = "@property", action = "Telescope oldfiles", key = "r" },
					{ desc = "󰒲 Plugins", group = "@constant", action = "Lazy", key = "l" },
					{ desc = "Quit", group = "@error", action = "qa", key = "q" },
				},
				project = {
					enable = true,
					limit = 5,
					icon = " ",
					label = "Recent Projects",
					action = "Telescope find_files cwd=",
				},
				mru = { enable = true, limit = 8, icon = " ", label = "Recent Files", cwd_only = false },
				footer = { "Let's code! 🚀", os.date("%Y-%m-%d %H:%M:%S") },
			},
		})
	end,
}
