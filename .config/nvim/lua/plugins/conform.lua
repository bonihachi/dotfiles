return {
	"stevearc/conform.nvim",
	enabled = true,
	event = "VeryLazy",
	dependencies = {
		"williamboman/mason.nvim",
	},
	opts = {
		format_on_save = {
			timeout_ms = 500,
			lst_fallback = true,
		},
		formatters_by_ft = {
			lua = { "stylua" },
			rust = { "rustfmt" },
		},
	},
}

