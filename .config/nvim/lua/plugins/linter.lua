return {
	"mfussenegger/nvim-lint",
	enabled = false,
	event = "BufWritePost",
	opts = {
		linters_by_ft = {
			rust = "clippy",
		},
	},
	config = function()
		local lint = require("lint")
		lint.try_lint()
	end,
}
