local status, lsp = pcall(require, "lsp-zero")

if (not status) then return end

lsp.preset("recommended")

-- Autocompletion
local cmp = require('cmp')
local cmp_action = lsp.cmp_action()
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<Up>'] = cmp.mapping.select_prev_item(cmp_select),
	['<Down>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-e>'] = cmp.mapping.abort(),
	["<C-Space>"] = cmp.mapping.complete(),
	-- `Enter` key to confirm completion
	['<CR>'] = cmp.mapping.confirm({ select = false }),
	['<C-CR>'] = cmp.mapping.confirm({ select = true }),
	['<tab>'] = cmp.mapping.confirm({ select = true }),
	-- Navigate between snippet placeholder
	['<C-f>'] = cmp_action.luasnip_jump_forward(),
	['<C-b>'] = cmp_action.luasnip_jump_backward(),
	-- Scroll up and down in the completion documentation
	['<C-u>'] = cmp.mapping.scroll_docs(-4),
	['<C-d>'] = cmp.mapping.scroll_docs(4),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

cmp.setup({
	mapping = cmp_mappings,
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	}
})

lsp.set_sign_icons({
	error = '✘',
	warn = '▲',
	hint = '⚑',
	info = '»'
})

-- Keybindings
local on_attach = (function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }
	lsp.default_keymaps({ buffer = bufnr })
	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
	vim.keymap.set("n", "<leader>dl", function() vim.diagnostic.setqflist() end, opts)
end)

lsp.on_attach(on_attach);

vim.diagnostic.config({
	virtual_text = true
})
