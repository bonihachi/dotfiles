return {
	"neovim/nvim-lspconfig",
	enabled = true,
	event = "VeryLazy",
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
				-- disable highlighting by LSP to prevent a conflict with treesitter
				client.server_capabilities.semanticTokensProvider = nil
				vim.lsp.inlay_hint.enable(true, { bufnr = bufnr }) end,
		})
	end,
}
