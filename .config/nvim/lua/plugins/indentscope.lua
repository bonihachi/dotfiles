return {
	"echasnovski/mini.indentscope",
	enabled = true,
	version = false, -- wait till new 0.7.0 release to put it back on semver
	event = "VeryLazy",
	opts = {
		-- symbol = "▏",
		symbol = "│",
		options = { try_as_border = true },
	},
	init = function()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"help",
				"alpha",
				"dashboard",
				"neo-tree",
				"notify",
			},
			callback = function()
				vim.b.miniindentscope_disable = true
			end,
		})
	end,
}
