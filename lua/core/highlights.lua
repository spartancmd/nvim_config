vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		vim.api.nvim_set_hl(0, "DiagnosticUnnecessary", {
			fg = "#8a8a8a",
			italic = false,
		})
	end,
})
