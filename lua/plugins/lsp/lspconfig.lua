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

		vim.lsp.config("clangd", {
			capabilities = capabilities,
			cmd = {
				vim.uv.os_uname().sysname == "Windows_NT" and "C:/msys64/ucrt64/bin/clangd.exe" or "clangd",
				"--compile-commands-dir=build",
				"--query-driver=C:/msys64/ucrt64/bin/*",
			},
			root_dir = function(bufnr, on_dir)
				on_dir(vim.fs.root(bufnr, {
					".git",
					"CMakeLists.txt",
				}))
			end,
		})

		vim.lsp.enable("clangd")

		vim.lsp.config("pyright", {
			capabilities = capabilities,
		})
	end,
}
