return {
	"nvim-lualine/lualine.nvim",
	enabled = true,
	event = "VeryLazy",
	opts = {
		options = {
			-- theme = "iceberg_dark",
			theme = "palenight",
			disabled_filetypes = {
				statusline = {
					"dashboard",
					"alpha",
					"starter",
					"lazy",
				},
			},
		},
	},
}
