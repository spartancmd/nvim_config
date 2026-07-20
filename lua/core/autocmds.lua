local function buf_map(buf, mode, bind, func, desc)
	vim.keymap.set(mode, bind, func, {
		buffer = buf,
		silent = true,
		desc = desc,
	})
end

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		buf_map(event.buf, "n", "gd", vim.lsp.buf.definition, "Go to definition")
		buf_map(event.buf, "n", "gr", vim.lsp.buf.references, "Show references")
		buf_map(event.buf, "n", "K", vim.lsp.buf.hover, "Hover documentation")
		buf_map(event.buf, "n", "<leader>cn", vim.lsp.buf.rename, "Rename symbol")
		buf_map(event.buf, "n", "<leader>ca", vim.lsp.buf.code_action, "Code actions")
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "c", "cpp" },
	callback = function(event)
		local runner = require("core.runner")

		buf_map(event.buf, "n", "<localleader>b", runner.build_cpp, "Build")
		buf_map(event.buf, "n", "<localleader>r", runner.run_cpp, "Run")
		buf_map(event.buf, "n", "<localleader>c", runner.build_and_run_cpp, "Build and run")
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function(event)
		local runner = require("core.runner")

		buf_map(event.buf, "n", "<localleader>r", runner.run_py, "Run")
	end,
})
