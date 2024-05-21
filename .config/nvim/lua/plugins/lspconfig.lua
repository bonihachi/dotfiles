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

		local lspconfig = require("lspconfig")

		-- set up rust-analyzer
		lspconfig.rust_analyzer.setup({
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
		lspconfig.clangd.setup({
			cmd = {
				"clangd",
				"--background-index",
				"--header-insertion=iwyu",
				"--completion-style=detailed",
				"--function-arg-placeholders",
				"--inlay-hints=true",
				"--log=verbose",
				"--clang-tidy",
			},
			filetypes = {
				"c",
				"cpp",
			},
			-- root_dir = function(fname)
			-- 	return lspconfig.util.root_pattern(".clangd", ".clang-tidy")(fname) or vim.fn.getcwd()
			-- end,
			root_dir = lspconfig.util.root_pattern(".clangd", ".clang-tidy", "compile_flags.txt"),
			init_options = {
				usePlaceholders = true,
				completeUnimported = true,
				clangdFileStatus = true,
			},
			on_attach = on_attach,
		})

		lspconfig.lua_ls.setup({
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
