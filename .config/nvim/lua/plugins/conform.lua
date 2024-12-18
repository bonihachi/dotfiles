return {
	"stevearc/conform.nvim",
	enabled = true,
	event = "VeryLazy",
	opts = {
		format_on_save = {
			timeout_ms = 3000,
			lst_fallback = true,
		},
		formatters_by_ft = {
			lua = { "stylua" },
			rust = { "rustfmt" },
			c = { "clang_format" },
			cpp = { "clang_format" },
		},
		formatters = {
			clang_format = {
			  prepend_args = { '--style=file', '--fallback-style=LLVM' },
			},
			shfmt = {
			  prepend_args = { '-i', '4' },
			},
		}
	},
}
