vim.diagnostic.config({
	float = {
		source = "always",
		border = vim.g.FloatBorders,
		title = "Diagnostics",
		title_pos = "left",
		header = "",
	},
	virtual_text = { spacing = 2, prefix = "◆" },
	underline = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = " ",
			[vim.diagnostic.severity.INFO] = "󰌵",
		},
	},
	update_in_insert = false,
	severity_sort = true,
})
