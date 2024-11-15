require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = {
		"html",
		"tsx",
		"markdown",
		"markdown_inline",
		"toml",
		"css",
		"javascript",
		"typescript",
		"dart",
		"php",
		"python",
		"c",
		"lua",
		"yaml",
		"json",
		"vim",
		"vimdoc",
		"query",
	},
	ignore_install = { "html" },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	highlight = {
		enable = true,
		disable = {},

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = false,
		disable = {},
	},
	autotag = {
		enable = true,
	},
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
