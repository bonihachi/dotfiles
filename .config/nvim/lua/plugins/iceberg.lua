return {
    'cocopon/iceberg.vim',
    enabled = true,
    event = 'VimEnter',
    name = 'iceberg',
    config = function()
        vim.cmd.colorscheme 'iceberg'
    end
}