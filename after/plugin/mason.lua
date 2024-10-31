local status, mason = pcall(require, "mason")
if (not status) then return end
local status2, mason_lspconfig = pcall(require, "mason-lspconfig")
if (not status2) then return end
local status3, lspconfig = pcall(require, "lspconfig")
if (not status3) then return end

mason.setup({})

mason_lspconfig.setup {
	ensure_installed = { "tailwindcss", "ts_ls", "volar" },
	handlers = {
		function(server_name)
			lspconfig[server_name].setup({})
		end,
		intelephense = function()
			lspconfig.intelephense.setup()
		end,
		astro = function()
			lspconfig.astro.setup({})
		end,
		ts_ls = function()
			local vue_typescript_plugin = require("mason-registry").get_package("vue-language-server"):get_install_path()
					.. '/node_modules/@vue/language-server'
					.. '/node_modules/@vue/typescript-plugin'
			lspconfig.ts_ls.setup({
				init_options = {
					preferences = {
						disableSuggestions = true,
					},
					plugins = {
						{
							name = "@vue/typescript-plugin",
							location = vue_typescript_plugin,
							languages = { 'vue' }
						}
					}
				},
				capabilities = require('cmp_nvim_lsp').default_capabilities(),
				single_file_support = false,
				on_init = function(client)
					-- disable formatting capabilities
					--client.server_capabilities.documentFormattingProvider = false
					--client.server_capabilities.documentFormattingRangeProvider = false
				end,
				filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "typescript.tsx", "vue" },
				cmd = { "typescript-language-server", "--stdio" }
			})
		end,
	},
}

local util = require("lspconfig.util")

lspconfig["dartls"].setup({
	cmd = { 'dart', 'language-server', '--protocol=lsp' },
	filetypes = { 'dart' },
	root_dir = util.root_pattern('pubspec.yaml'),
	init_options = {
		onlyAnalyzeProjectsWithOpenFiles = true,
		suggestFromUnimportedLibraries = true,
		closingLabels = false,
		outline = true,
		flutterOutline = false,
	},
	settings = {
		dart = {
			completeFunctionCalls = true,
			analysisExcludedFolders = {
				vim.fn.expand("$HOME/AppData/Local/Pub/Cache"),
				vim.fn.expand("$HOME/.pub-cache"),
				vim.fn.expand("/opt/homebrew/"),
				vim.fn.expand("$HOME/Perconte/sdk/flutter/"),
			}
		}
	}
})
