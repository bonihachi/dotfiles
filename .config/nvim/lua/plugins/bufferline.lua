return {
    "akinsho/bufferline.nvim",
    event = "BufReadPre", -- This prevents dashboard to have a tab
    keys = {
        -- { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
        {
            "<S-tab>",
            "<cmd>BufferLineCyclePrev<cr>",
            desc = "Prev Buffer"
        },
        {
            "<tab>",
            "<cmd>BufferLineCycleNext<cr>",
            desc = "Next Buffer"
        },
    },
    opts = {
        options = {
            mode = 'tabs',
            separator_style = 'slant',
            show_buffer_close_icons = true,
            show_close_icon = true,
            color_icons = true,
            right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
            diagnostics = "nvim_lsp",
            always_show_bufferline = true,
            diagnostics_indicator = function(_, _, diag)
            local icons = require("lazyvim.config").icons.diagnostics
            local ret = (diag.error and icons.Error .. diag.error .. " " or "")
                .. (diag.warning and icons.Warn .. diag.warning or "")
            return vim.trim(ret)
            end,
            offsets = {
                {
                    filetype = "neo-tree",
                    text = "Neo-tree",
                    highlight = "Directory",
                    text_align = "left",
                },
            },
        },
    },
    config = function(_, opts)
        require("bufferline").setup(opts)
        -- Fix bufferline when restoring a session
        vim.api.nvim_create_autocmd("BufAdd", {
            callback = function()
                vim.schedule(function()
                pcall(nvim_bufferline)
            end)
        end,
        })
    end,
}
