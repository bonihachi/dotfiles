require("base")
require("autocmds")

if vim.g.vscode then
	require("vscode-keymaps")
else
	require("options")
	require("keymaps")
	require("colorscheme")
	require("plugins")
end
