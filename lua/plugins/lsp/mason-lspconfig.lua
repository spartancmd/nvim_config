return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		"mason-org/mason.nvim",
		"neovim/nvim-lspconfig",
	},
	opts = {
		automatic_enable = true,
		ensure_installed = {
			"lua_ls",
			"clangd",
			"pyright",
		},
	},
}
