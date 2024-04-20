if vim.g.vscode then
  return
end

require("toggleterm").setup {
  shell = "/usr/bin/fish",
}
