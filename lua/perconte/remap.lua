vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("i", "kj", "<Esc>")

-- move half up or down and center the view
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")

-- normal yank
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
-- also copy to system clipboard
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "Q", "<nop>")

-- Formatter!
vim.keymap.set({ "n", "v" }, "<leader>gf", function()
	vim.lsp.buf.format()
end)
vim.keymap.set({"n"}, "<leader>f", ":Format<CR>", {silent = true})
vim.keymap.set({"n"}, "<leader>F", ":FormatWrite<CR>", {silent = true})

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end)

-- from devaslife

-- Split Window
vim.keymap.set("n", "ss", ":split<Return><C-w>w", { silent = true })
vim.keymap.set("n", "sv", ":vsplit<Return><C-w>w", { silent = true })

-- Move between Window
vim.keymap.set("n", "sh", "<C-w>h")
vim.keymap.set("n", "sj", "<C-w>j")
vim.keymap.set("n", "sk", "<C-w>k")
vim.keymap.set("n", "sl", "<C-w>l")

-- Resize Window
vim.keymap.set("n", "<C-w><left>", "<C-w><")
vim.keymap.set("n", "<C-w><right>", "<C-w>>")
vim.keymap.set("n", "<C-w><up>", "<C-w>+")
vim.keymap.set("n", "<C-w><down>", "<C-w>-")

-- translate
vim.keymap.set("n", "<leader>te", "viw :Translate EN<CR>")
vim.keymap.set("n", "<leader>ti", "viw :Translate ID<CR>")
vim.keymap.set("v", "<leader>te", ":Translate EN<CR>")
vim.keymap.set("v", "<leader>ti", ":Translate ID<CR>")
