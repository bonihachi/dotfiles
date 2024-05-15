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
		local on_attach = function(client, bufnr)
			-- prevent conflict with treesitter highlighting
			if client.server_capabilities.semanticTokensProvider then
				client.server_capabilities.semanticTokensProvider = nil
			end
			vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
		end

		-- set up rust-analyzer
		require("lspconfig").rust_analyzer.setup({
			settings = {
				["rust-analyzer"] = {
					check = {
						command = "clippy",
					},
				},
			},
			on_attach = on_attach,
		})

		-- set up clangd config
		require("lspconfig").clangd.setup({
			on_attach = on_attach,
		})

		require("lspconfig").lua_ls.setup({
			settings = {
				Lua = {
					workspace = {
						checkThirdParty = false,
					},
					codeLens = {
						enable = true,
					},
					completion = {
						callSnippet = "Replace",
					},
				},
			},
			on_attach = on_attach,
		})
	end,
}
