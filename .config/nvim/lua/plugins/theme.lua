return {
	--'cocopon/iceberg.vim',
	--"kyazdani42/blue-moon",
	-- "rockerBOO/boo-colorscheme-nvim",
	-- "rebelot/kanagawa.nvim",
	-- "jim-at-jibba/ariake.nvim",
	-- "mhartington/oceanic-next",
	-- "tiagovla/tokyodark.nvim",
	-- "mhartington/oceanic-next",
	"EdenEast/nightfox.nvim",
	enabled = true,
	event = "VeryLazy",
	config = function()
		vim.cmd.colorscheme("nightfox")
	end,
}
