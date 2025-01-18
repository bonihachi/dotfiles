return {
	"nvim-neo-tree/neo-tree.nvim",
	enabled = true,
	-- event = "VeryLazy",
	cmd = "Neotree",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{
			"<C-t>",
			function()
				require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
			end,
			desc = "Explorer NeoTree (cwd)",
		},
		{
			"gs",
			function()
				require("neo-tree.command").execute({ source = "git_status", toggle = true })
			end,
			desc = "Git Explorer",
		},
		{
			"<C-f>",
			"<cmd>Neotree focus<CR>",
			desc = "Focus on NeoTree",
		},
	},
	opts = {
		close_if_last_window = true,
		filesystem = {
			filtered_items = {
				visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
				hide_dotfiles = false,
				hide_gitignored = true,
			},
			window = {
				width = 30,
			},
		},
		git_status = {
			window = {
				position = "float",
			},
		},
	},
}
