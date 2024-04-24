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
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = ">>",
					[vim.diagnostic.severity.HINT] = ">",
					[vim.diagnostic.severity.INFO] = ">",
				},
			},
		},
		inlay_hints = {
			enabled = true,
		},
		code_lens = {
			enabled = true,
		},
		servers = {
			rust_analyzer = {
				settings = {
					["rust-analyzer"] = {
						check = {
							command = "clippy",
							extraArgs = {
								"--",
								"--no-deps",
								"-Dclippy::correctness",
								"-Dclippy::complexity",
								"-Wclippy::perf",
								"-Wclippy::pedantic",
							},
						},
					},
				},
				on_attach = function(client, bufnr)
					-- disable highlighting by LSP to prevent a conflict with treesitter
					client.server_capabilities.semanticTokensProvider = nil
					vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
				end,
			},
			lua_ls = {
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
			},
		},
	},
	init = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")

		mason.setup()

		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
			},
		})
	end,
	config = function(_, opts)
		-- diagnostics signs
		if vim.fn.has("nvim-0.10.0") == 0 then
			for severity, icon in pairs(opts.diagnostics.signs.text) do
				local name = vim.diagnostic.severity[severity]:lower():gsub("^%l", string.upper)
				name = "DiagnosticSign" .. name
				vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
			end
		end

		if type(opts.diagnostics.virtual_text) == "table" and opts.diagnostics.virtual_text.prefix == "icons" then
			opts.diagnostics.virtual_text.prefix = vim.fn.has("nvim-0.10.0") == 0 and "●"
				or function(diagnostic)
					local icons = require("lazyvim.config").icons.diagnostics
					for d, icon in pairs(icons) do
						if diagnostic.severity == vim.diagnostic.severity[d:upper()] then
							return icon
						end
					end
				end
		end

		vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

		-- setup servers
		local lspconfig = require("lspconfig")
		local servers = opts.servers

		for server, server_opts in pairs(servers) do
			lspconfig[server].setup(server_opts)
		end
	end,
}
