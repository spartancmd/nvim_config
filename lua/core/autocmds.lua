local function map(buf, mode, lhs, rhs, desc)
	vim.keymap.set(mode, lhs, rhs, {
		buffer = buf,
		silent = true,
		desc = desc,
	})
end

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		map(event.buf, "n", "gd", vim.lsp.buf.definition, "Go to definition")
		map(event.buf, "n", "gr", vim.lsp.buf.references, "Show references")
		map(event.buf, "n", "K", vim.lsp.buf.hover, "Hover documentation")
		map(event.buf, "n", "<leader>cn", vim.lsp.buf.rename, "Rename symbol")
		map(event.buf, "n", "<leader>ca", vim.lsp.buf.code_action, "Code actions")
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "c", "cpp" },
	callback = function(event)
		local runner = require("core.runner")

		map(event.buf, "n", "<localleader>b", runner.build_cpp, "Build")
		map(event.buf, "n", "<localleader>r", runner.run_cpp, "Run")
		map(event.buf, "n", "<localleader>c", runner.build_and_run_cpp, "Build and run")
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function(event)
		local runner = require("core.runner")

		map(event.buf, "n", "<localleader>r", runner.run_py, "Run")
	end,
})
