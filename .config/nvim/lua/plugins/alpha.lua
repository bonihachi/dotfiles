
local ascii = {
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                     ",
}

local function button(sc, txt, keybind)
    local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")
    local opts = {
        position = "center",
        text = txt,
        shortcut = sc,
        cursor = 6,
        width = 19,
        align_shortcut = "right",
        hl_shortcut = "Number",
        hl = "Function",
    }
end

return {
    'goolord/alpha-nvim',
    enabled =false,
    event = 'VimEnter',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        local present, alpha = pcall(require, 'alpha')
        if not present then
            return
        end
        local header = {
            type = 'text',
            val = ascii,
            opts = {
                position = 'center',
                hl = 'String',
            },
        }
        local buttons = {
            type = 'group',
            val = {
                button("t", "  Neotree", ":Neotree toggle<Return>"),
                button("n", "  New file", ":ene <BAR> startinsert <CR>"),
                button("r", "  Recent file", ":Telescope oldfiles <CR>"),
                button("f", "󰥨  Find file", ":Telescope find_files <CR>"),
                button("g", "󰱼  Find text", ":Telescope live_grep <CR>"),
                button(">", " Terminal", ":terminal<Return>"),
                button("s", "  Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
                button("q", "  Quit", ":qa<CR>"),
            },
            opts = {
                position = 'center',
                spacing = 1,
            },
        }
        local section = {
            header = header,
            buttons = buttons,
            footer = {
                type = 'text',
                opts = {
                    position = 'center',
                    hl = 'Comment',
                }
            }
        }
        local opts = {
            layout = {
                { type = "padding", val = function() return math.floor(vim.o.lines * 0.25) end },
                section.header,
                { type = "padding", val = 1 },
                section.buttons,
                { type = "padding", val = 1 },
                section.footer,
            },
            opts = {
            },
        }
        alpha.setup(opts)
        local autocmd = vim.api.nvim_create_autocmd -- Create autocommand
        autocmd("User", {
            pattern = "LazyVimStarted",
            callback = function()
                local stats = require("lazy").stats()
                -- local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                local ms = stats.startuptime
                local version = " v" ..
                    vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
                local plugins = "⚡plugins " .. stats.loaded .. "/" .. stats.count .. " in " .. ms .. "ms"
                local footer = version .. "\t" .. plugins .. "\n"
                section.footer.val = footer
                pcall(vim.cmd.AlphaRedraw)
            end,
        })
        -- Disable the statusline, tabline and cmdline while the alpha dashboard is open
        autocmd('User', {
            pattern = 'AlphaReady',
            desc = 'disable status, tabline and cmdline for alpha',
            callback = function()
                vim.go.laststatus = 0
                vim.opt.showtabline = 0
                vim.opt.cmdheight = 0
            end,
        })
        autocmd('BufUnload', {
            buffer = 0,
            desc = 'enable status, tabline and cmdline after alpha',
            callback = function()
                vim.go.laststatus = 2
                vim.opt.showtabline = 2
                vim.opt.cmdheight = 1
            end,
        })
    end
}