return {
	--'cocopon/iceberg.vim',
	-- "rebelot/kanagawa.nvim",
	-- "tiagovla/tokyodark.nvim",
	"EdenEast/nightfox.nvim",
	-- "kdheepak/monochrome.nvim",
	enabled = true,
	lazy = false,
	event = "VeryLazy",
	config = function()
		vim.cmd.colorscheme("nightfox")
	end,
}
