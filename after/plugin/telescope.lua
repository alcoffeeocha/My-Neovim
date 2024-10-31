local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', function()
	builtin.find_files({
		no_ignore = false,
		hidden = true
	})
end)
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > "), word_match = "-w" });
end)
vim.keymap.set('n', ';r', function()
	builtin.live_grep()
end)
vim.keymap.set('n', '\\\\', function()
	builtin.buffers()
end)
-- This is your opts table
require("telescope").setup {
	defaults = {
		mappings = {
			i = {
				["q"] = require("telescope.actions").close,
			},
		},
		file_ignore_patterns = {
			".git",
			"node_modules",
			".nuxt",
			".next"
		}
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown {
				-- even more opts
			},

			-- pseudo code / specification for writing custom displays, like the one
			-- for "codeactions"
			specific_opts = {
				--   [kind] = {
				--     make_indexed = function(items) -> indexed_items, width,
				--     make_displayer = function(widths) -> displayer
				--     make_display = function(displayer) -> function(e)
				--     make_ordinal = function(e) -> string
				--   },
				--   -- for example to disable the custom builtin "codeactions" display
				--      do the following
				codeactions = false,
			}
		}
	}
}
-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("ui-select")
