return {
    's1n7ax/nvim-window-picker',
    enabled = true,
    version = '2.*',
    event = 'VeryLazy',
    opts = {
        filter_rules = {
            include_current_win = false,
            autoselect_one = true,
            -- filter using buffer options
            bo = {
                -- if the file type is one of the following, the window will be ignored
                filetype = {
                    'neo-tree',
                    'neo-tree-popup',
                    'notify',
                },
                -- if the buffeer type is one of the following, the window will be ignored
                buftype =  {
                    'terminal',
                    'quickfix',
                },
            }
        }
    }
}