return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,

	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		---@type snacks.Config
		dashboard = {
			width = 60,
			row = nil, -- dashboard position. nil for center
			col = nil, -- dashboard position. nil for center
			pane_gap = 4, -- empty columns between vertical panes
			autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", -- autokey sequence
			-- These settings are used by some built-in sections
			preset = {
				-- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
				---@type fun(cmd:string, opts:table)|nil
				pick = nil,
				-- Used by the `keys` section to show keymaps.
				-- Set your custom keymaps here.
				-- When using a function, the `items` argument are the default keymaps.
				---@type snacks.dashboard.Item[]
				keys = {
					{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
					{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
					{
						icon = " ",
						key = "g",
						desc = "Find Text",
						action = ":lua Snacks.dashboard.pick('live_grep')",
					},
					{
						icon = " ",
						key = "r",
						desc = "Recent Files",
						action = ":lua Snacks.dashboard.pick('oldfiles')",
					},
					{
						icon = " ",
						key = "c",
						desc = "Config",
						action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
					},
					{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
					{
						icon = "󰒲 ",
						key = "L",
						desc = "Lazy",
						action = ":Lazy",
						enabled = package.loaded.lazy ~= nil,
					},
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
				-- Used by the `header` section
				header = [[
 _________  ________  ___  __        ___    ___ ________  ________   ___  ________  ___  ___  _________   
|\___   ___\\   __  \|\  \|\  \     |\  \  /  /|\   __  \|\   ___  \|\  \|\   ____\|\  \|\  \|\___   ___\ 
\|___ \  \_\ \  \|\  \ \  \/  /|_   \ \  \/  / | \  \|\  \ \  \\ \  \ \  \ \  \___|\ \  \\\  \|___ \  \_| 
     \ \  \ \ \  \\\  \ \   ___  \   \ \    / / \ \  \\\  \ \  \\ \  \ \  \ \  \  __\ \   __  \   \ \  \  
      \ \  \ \ \  \\\  \ \  \\ \  \   \/  /  /   \ \  \\\  \ \  \\ \  \ \  \ \  \|\  \ \  \ \  \   \ \  \ 
       \ \__\ \ \_______\ \__\\ \__\__/  / /      \ \_______\ \__\\ \__\ \__\ \_______\ \__\ \__\   \ \__\
        \|__|  \|_______|\|__| \|__|\___/ /        \|_______|\|__| \|__|\|__|\|_______|\|__|\|__|    \|__|
                                   \|___|/                                                                
]],
			},
			-- item field formatters
			formats = {
				icon = function(item)
					if item.file and item.icon == "file" or item.icon == "directory" then
						return require("snacks").icon(item.file, item.icon)
					end
					return { item.icon, width = 2, hl = "icon" }
				end,
				footer = { "%s", align = "center" },
				header = { "%s", align = "center" },
				file = function(item, ctx)
					local fname = vim.fn.fnamemodify(item.file, ":~")
					fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname) or fname
					if #fname > ctx.width then
						local dir = vim.fn.fnamemodify(fname, ":h")
						local file = vim.fn.fnamemodify(fname, ":t")
						if dir and file then
							file = file:sub(-(ctx.width - #dir - 2))
							fname = dir .. "/…" .. file
						end
					end
					local dir, file = fname:match("^(.*)/(.+)$")
					return dir and { { dir .. "/", hl = "dir" }, { file, hl = "file" } } or { { fname, hl = "file" } }
				end,
			},
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 1 },
				{ section = "startup" },
			},
		},
		indent = {
			priority = 1,
			enabled = true, -- enable indent guides
			char = "│",
			only_scope = false, -- only show indent guides of the scope
			only_current = false, -- only show indent guides in the current window
			hl = "SnacksIndent", ---@type string|string[] hl groups for indent guides
			-- can be a list of hl groups to cycle through
			-- hl = {
			--     "SnacksIndent1",
			--     "SnacksIndent2",
			--     "SnacksIndent3",
			--     "SnacksIndent4",
			--     "SnacksIndent5",
			--     "SnacksIndent6",
			--     "SnacksIndent7",
			--     "SnacksIndent8",
			-- },
		},
		-- animate scopes. Enabled by default for Neovim >= 0.10
		-- Works on older versions but has to trigger redraws during animation.
		---@class snacks.indent.animate: snacks.animate.Config
		---@field enabled? boolean
		--- * out: animate outwards from the cursor
		--- * up: animate upwards from the cursor
		--- * down: animate downwards from the cursor
		--- * up_down: animate up or down based on the cursor position
		---@field style? "out"|"up_down"|"down"|"up"
		animate = {
			enabled = vim.fn.has("nvim-0.10") == 1,
			style = "out",
			easing = "linear",
			duration = {
				step = 20, -- ms per step
				total = 500, -- maximum duration
			},
		},
		-- ---@class snacks.indent.Scope.Config: snacks.scope.Config
		-- terminal = {
		-- 	win = { style = "terminal" },
		-- },
	},
}
