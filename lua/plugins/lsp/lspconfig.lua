return {
	"neovim/nvim-lspconfig",

	config = function()
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		-- configure each server with:
		-- vim.lsp.config(server_name, config)
		-- setting = ... will be passed to the language server

		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
		})

		vim.lsp.config("neocmake", {
			capabilities = capabilities,
		})
	end,
}
