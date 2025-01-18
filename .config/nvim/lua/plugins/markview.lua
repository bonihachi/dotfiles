return {
	"OXY2DEV/markview.nvim",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function(_, opts)
		local presets = require("markview.presets").headings

		require("markview").setup({
			headings = presets.slanted,
		})
	end,
}
