require("base")
require("autocmds")

if vim.g.vscode then
	vim.opt.packpath:remove(vim.fn.stdpath('data').."/site")
	require("vscode-keymaps")
else
	require("options")
	require("keymaps")
	require("colorscheme")
	require("plugins")
end