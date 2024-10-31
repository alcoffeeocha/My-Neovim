local status, lint = pcall(require, "lint")
if (not status) then return end
lint.linters_by_ft = {
	javascript = {'eslint'},
	typescript = {'eslint'}
}

vim.api.nvim_create_autocmd({"BufWritePost"}, {
	callback = function()
		lint.try_lint()
	end,
})
