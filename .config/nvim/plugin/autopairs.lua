if vim.g.vscode then
  return
end

local status, autopairs = pcall(require, "nvim-autopairs")
if (not status) then return end

autopairs.setup({
  check_ts = true,
  disable_filetype = { "TelescopePrompt", "vim" },
})
