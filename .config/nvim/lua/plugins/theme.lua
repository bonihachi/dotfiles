return {
    --'cocopon/iceberg.vim',
	--"kyazdani42/blue-moon",
	--"rockerBOO/boo-colorscheme-nvim",
    "rebelot/kanagawa.nvim",
    enabled = true,
    event = 'VeryLazy',
    config = function()
        vim.cmd.colorscheme 'kanagawa'
    end
}
