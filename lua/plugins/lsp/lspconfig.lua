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

		vim.lsp.enable("lua_ls")

		vim.lsp.config("neocmake", {
			capabilities = capabilities,
		})

		vim.lsp.enable("neocmake")

		-- NOTE: expected clangd to be installed separately
		vim.lsp.config("clangd", {
			capabilities = capabilities,
			cmd = {
				vim.uv.os_uname().sysname == "Windows_NT" and "C:/msys64/ucrt64/bin/clangd.exe" or "clangd",
				"--background-index",
				"--compile-commands-dir=build",
				"--query-driver=C:/msys64/ucrt64/bin/*",
			},
		})

		vim.lsp.enable("clangd")

		vim.lsp.config("pyright", {
			capabilities = capabilities,
		})

		vim.lsp.enable("pyright")
	end,
}
