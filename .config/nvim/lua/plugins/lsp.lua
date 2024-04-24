return {
	"neovim/nvim-lspconfig",
	enabled = true,
	event = "VeryLazy",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"williamboman/mason.nvim",
	},
	opts = {
		diagnostics = {
			underline = true,
			update_in_insert = false,
			virtual_text = {
				spacing = 4,
				source = "if_many",
				prefix = "●",
			},
			severity_sort = true,
		},
		inlay_hints = {
			enabled = true,
		},
		code_lens = {
			enabled = true,
		},
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local lspconfig = require("lspconfig")

		mason.setup()

		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
			},
		})

		lspconfig.rust_analyzer.setup({
			on_attach = function(client, bufnr)
				-- disable highlighting by LSP to prevent a conflict with treesitter
				client.server_capabilities.semanticTokensProvider = nil
				vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
			end,
		})

		lspconfig.lua_ls.setup({})
	end,
}
