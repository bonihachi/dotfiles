if vim.g.vscode then
  return
end

require('hlchunk').setup({
  chunk = {
    style = {
      { fg = "#cdd1e6" },
      { fg = "#c21f30" }, -- this fg is used to highlight wrong chunk
    },
    chars = {
      horizontal_line = "─",
      vertical_line = "│",
      left_top = "╭",
      left_bottom = "╰",
      right_arrow = "➤",
    },
  },
  indent = {
    enable = true,
    chars = { "│", "¦", "┆", "┊", }, -- more code can be found in https://unicodeplus.com/

    style = {
      "#4C566A",
    },
  },
  line_num = {
    enable = true,
    use_treesitter = false,
    style = "#cdd1e6",
  },

  blank = {
    enable = false,
    chars = {
      " ",
    },
    style = {
      { bg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("cursorline")), "bg", "gui") },
      { bg = "",                                                                         fg = "" },
    }
  }
})
