local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

null_ls.setup({
	on_attach = function(client, _)
		if client.server_capabilities.documentFormattingProvider then
			vim.api.nvim_command [[augroup Format]]
			vim.api.nvim_command [[autocmd! * <buffer>]]
			vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ async = false })]]
			vim.api.nvim_command [[augroup END]]
		end
	end
})
