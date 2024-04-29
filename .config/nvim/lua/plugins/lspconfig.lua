return {
	"neovim/nvim-lspconfig",
	enabled = true,
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	keys = {
		{
			"gd",
			vim.lsp.buf.definition(),
			desc = "Definition jump",
		},
	},
	config = function()
		require("lspconfig").rust_analyzer.setup({
			settings = {
				["rust-analyzer"] = {
					check = {
						command = "clippy",
					},
				},
			},
			on_attach = function(client, bufnr)
				-- prevent conflict with treesitter highlighting
				if client.server_capabilities.semanticTokensProvider then
					client.server_capabilities.semanticTokensProvider = nil
				end
				vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
			end,
		})
	end,
}
