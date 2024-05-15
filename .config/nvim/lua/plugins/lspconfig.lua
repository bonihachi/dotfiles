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
			"<cmd>lua vim.lsp.buf.definition()<CR>",
			desc = "Definition jump",
		},
	},
	config = function()
		local on_attach = function(client, bufnr)
			-- prevent conflict with treesitter highlighting
			if client.server_capabilities.semanticTokensProvider then
				client.server_capabilities.semanticTokensProvider = nil
			end

			if client.server_capabilities.inlayHintProvider then
				vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
			end
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
			cmd = {
				"clangd",
				"--background-index",
				"--header-insertion=iwyu",
				"--completion-style=detailed",
				"--function-arg-placeholders",
			},
			init_options = {
				usePlaceholders = true,
				completeUnimported = true,
				clangdFileStatus = true,
			},
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
