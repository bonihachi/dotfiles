return {
    'nvim-treesitter/nvim-treesitter',
    event = {
        'BufReadPost',
        'BufNewFile',
    },
    build = ':TSUpdate',
    cmd = 'TSUpdateSync',
    opts = {
        ensure_instaled = {
            'vim',
            'regex',
			'lua',
			'markdown',
			'markdown_inline',
			'rust'
        },
        autoinstall = true,
        highlight = {
            enable = true,
        },
        indent = {
            enable = true,
        }
    }
}
