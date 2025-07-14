return {
	{
		"mason-org/mason.nvim",
		opts = {
			ensure_installed = {
				"clang-format",
			},
		},
		config = function(_, opts)
			require("mason").setup(opts)
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
			ensure_installed = {
				"pyright",
				"lua_ls",
				"ts_ls",
				"clangd",
				"jsonls",
				"marksman",
			},
		},
		config = function(_, opts)
			require("mason-lspconfig").setup(opts)
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		event = "VeryLazy",
		opts = {
			ensure_installed = {
				"codelldb",
				"python",
				"delve",
				"js",
				"node2",
			},
			handlers = {
				function(config)
					require("mason-nvim-dap").default_setup(config)
				end,
			},
		},
	},
}
