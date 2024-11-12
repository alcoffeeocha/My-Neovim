local status, lint = pcall(require, "lint")
if not status then
	return
end

lint.linters_by_ft = {
	javascript = { "eslint" },
	javascriptreact = { "eslint" },
	typescript = { "eslint" },
	typescriptreact = { "eslint" },
}

--[[
local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	group = lint_augroup,
	callback = function()
		lint.try_lint()
	end,
})
--]]
