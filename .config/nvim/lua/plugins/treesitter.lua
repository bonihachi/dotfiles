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