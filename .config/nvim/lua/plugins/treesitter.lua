return {
    'nvim-treesitter/nvim-treesitter',
    event = {
        'BufReadPost',
        'BufNewFile',
    },
    build = ':TSUpdate',
    cmd = 'TSUpdateSync',
    opts = {
        highlight = {
            enable = true,
        },
        indent = {
            enable = true,
        }
    }
}