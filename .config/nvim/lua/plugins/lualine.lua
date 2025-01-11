return {
	"nvim-lualine/lualine.nvim",
	enabled = true,
	event = "VeryLazy",
	opts = {
		options = {
			-- theme = "iceberg_dark",
			-- theme = "nightfox",
			disabled_filetypes = {
				statusline = {
					"dashboard",
					"alpha",
					"starter",
					"lazy",
					"neo-tree",
				},
			},
			always_divide_middle = true,
			globalstatus = false,
		},
	},
	config = function(_, opts)
		vim.cmd("colorscheme")
		require("lualine").setup(opts)
	end,
}
