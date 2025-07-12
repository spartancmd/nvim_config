return {
	-- Setup Folding with nvim-ufo
	{
		"kevinhwang91/nvim-ufo",
		dependencies = {
			"kevinhwang91/promise-async",
		},
		config = function()
			require("ufo").setup({
				provider_selector = function(_, _, _)
					return { "treesitter", "indent" }
				end,
				open_fold_hl_timeout = 0,
			})

			-- Set fold-related options
			vim.opt.foldmethod = "manual"
			-- vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
			-- vim.opt.foldtext = ""
			vim.o.foldenable = true
			vim.o.foldcolumn = "0"
			vim.o.foldlevel = 99
			vim.o.foldlevelstart = 99

			-- Immediately compute folds on buffer read
			vim.api.nvim_create_autocmd("BufReadPost", {
				callback = function()
					require("ufo").enable()
				end,
			})

			-- Save folds automatically on buffer leave
			vim.api.nvim_create_autocmd("BufWinLeave", {
				pattern = "*",
				callback = function()
					vim.cmd("silent! mkview")
				end,
			})

			-- Load folds when buffer is opened
			vim.api.nvim_create_autocmd("BufWinEnter", {
				pattern = "*",
				callback = function()
					vim.cmd("silent! loadview")
				end,
			})
		end,
	},
}
