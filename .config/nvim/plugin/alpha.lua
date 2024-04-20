if vim.g.vscode then
  return
end

local status, alpha = pcall(require, "alpha")
if not status then
  return
end

local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {
  "                                                     ",
  "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
  "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
  "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
  "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
  "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
  "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
  "                                                     ",
}

-- Set menu
dashboard.section.buttons.val = {
  dashboard.button("t", "  Neotree", ":Neotree toggle<Return>"),
  dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("r", "  Recent file", ":Telescope oldfiles <CR>"),
  dashboard.button("f", "󰥨  Find file", ":Telescope find_files <CR>"),
  dashboard.button("g", "󰱼  Find text", ":Telescope live_grep <CR>"),
  dashboard.button(">", " Terminal", ":terminal<Return>"),
  dashboard.button("s", "  Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
  dashboard.button("q", "  Quit", ":qa<CR>"),
}

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Set footer
local function footer()
  local datetime = os.date(" %Y-%m-%d   %H:%M:%S")
  local version = vim.version()
  local version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch
  return datetime .. version_info
end
dashboard.section.footer.val = footer()

-- Disable folding on alpha buffer
vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
