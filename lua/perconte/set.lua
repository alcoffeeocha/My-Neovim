-- from devaslife
vim.cmd('autocmd!')
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.titlestring = "%t %M (%{expand('%:~:h')})"
vim.opt.title = false
vim.opt.ai = true
vim.opt.path:append {'**'} -- Finding files, search down into sub folder
vim.opt.wildignore:append {'*/node_modules/*'}
--

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME").."/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8

vim.opt.updatetime = 50

vim.opt.cursorline = false
vim.opt.termguicolors = true
vim.opt.colorcolumn = "80"

vim.opt.guicursor = "n-v-c-sm:block"

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="line"})]]
vim.opt.showmode = false

-- obsidian
vim.opt.conceallevel = 1
