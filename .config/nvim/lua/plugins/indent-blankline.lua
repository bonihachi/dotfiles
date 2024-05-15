return {
	"lukas-reineke/indent-blankline.nvim",
	enabled = true,
	main = "ibl",
	event = "VeryLazy",
	opts = {
		indent = {
			char = "│",
			tab_char = "│",
		},
		scope = {
			enabled = false,
		},
		exclude = {
			filetypes = {
				"help",
				"alpha",
				"dashboard",
				"neo-tree",
				"lazy",
				"notify",
			},
		},
	},
}
