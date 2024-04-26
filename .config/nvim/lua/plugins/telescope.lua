return {
    'nvim-telescope/telescope.nvim',
    enabled = false,
    cmd = {
        "Telescope",
    },
    event = { "BufReadPre", "BufNewFile" },
    keys = {
        {
            ";m",
            "<cmd>Telescope marks<cr>",
            desc = "search by [M]arks"
        },
        {
            ";f",
            "<cmd>Telescope find_files hidden=true<cr>",
            desc = "search [F]iles"},
        {
            ";g",
            "<cmd>Telescope live_grep<cr>",
            desc = "search by [G]rep"},
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "fdschmidt93/telescope-egrepify.nvim",
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local egrep_actions = require "telescope._extensions.egrepify.actions"
        telescope.setup({
        defaults = {
            path_display = { "truncate " },
            mappings = {
                i = {
                    ['<C-u>'] = false,
                    ['<C-d>'] = false,
                    ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                },
            },
        },
            extensions = {
                egrepify = {
                    -- intersect tokens in prompt ala "str1.*str2" that ONLY matches
                    -- if str1 and str2 are consecutively in line with anything in between (wildcard)
                    AND = true,                   -- default
                    permutations = false,         -- opt-in to imply AND & match all permutations of prompt tokens
                    lnum = true,                  -- default, not required
                    lnum_hl = "EgrepifyLnum",     -- default, not required, links to `Constant`
                    col = false,                  -- default, not required
                    col_hl = "EgrepifyCol",       -- default, not required, links to `Constant`
                    title = true,                 -- default, not required, show filename as title rather than inline
                    filename_hl = "EgrepifyFile", -- default, not required, links to `Title`
                    -- suffix = long line, see screenshot
                    -- EXAMPLE ON HOW TO ADD PREFIX!
                    prefixes = {
                        -- ADDED ! to invert matches
                        -- example prompt: ! sorter
                        -- matches all lines that do not comprise sorter
                        -- rg --invert-match -- sorter
                        ["!"] = {
                            flag = "invert-match",
                        },
                        -- HOW TO OPT OUT OF PREFIX
                        -- ^ is not a default prefix and safe example
                        ["^"] = false
                    },
                    -- default mappings
                    mappings = {
                        i = {
                            -- toggle prefixes, prefixes is default
                            ["<C-z>"] = egrep_actions.toggle_prefixes,
                            -- toggle AND, AND is default, AND matches tokens and any chars in between
                            ["<C-a>"] = egrep_actions.toggle_and,
                            -- toggle permutations, permutations of tokens is opt-in
                            ["<C-r>"] = egrep_actions.toggle_permutations,
                        },
                    },
                },
            },
        })
    telescope.load_extension("egrepify")
    end,
}
