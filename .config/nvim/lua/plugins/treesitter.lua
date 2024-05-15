return {
	"nvim-treesitter/nvim-treesitter",
	event = "VeryLazy",
	build = ":TSUpdate",
	cmd = "TSUpdateSync",
	opts = {
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		indent = {
			enable = true,
		},
		ensure_installed = {
			"vim",
			"regex",
			"lua",
			"markdown",
			"markdown_inline",
			"rust",
			"vimdoc",
		},
		sync_install = false,
		auto_install = true,
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
