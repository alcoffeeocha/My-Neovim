-- This file can be loaded by calling `lua require('plugins')` from your init.vimpack
local status, packer = pcall(require, "packer")
if (not status) then
	print("Packer is not installed")
	return
end
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return packer.startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	--use { "ellisonleao/gruvbox.nvim" }
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		-- or                            , branch = '0.1.x',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	use { 'nvim-telescope/telescope-ui-select.nvim' }
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use('windwp/nvim-ts-autotag')
	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup { disable_filetype = { "TelescopePrompt", "vim" } } end
	}
	use('nvim-treesitter/playground')
	use('theprimeagen/harpoon')
	use('mbbill/undotree')
	use('tpope/vim-fugitive')
	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },          -- Required
			{ 'williamboman/mason.nvim' },        -- Optional
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },  -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'L3MON4D3/LuaSnip' },  -- Required
		}
	}
	use("eandrju/cellular-automaton.nvim")
	use("reisub0/hot-reload.vim")
	use("nvim-tree/nvim-web-devicons")
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}
	use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }
	use("Glench/Vim-Jinja2-Syntax")

	use({ 'rose-pine/neovim', as = 'rose-pine' })
	--use({ 'Th3Whit3Wolf/one-nvim' })
	use("rebelot/kanagawa.nvim")
	use("JoosepAlviste/palenightfall.nvim")
	--https://github.com/nvim-treesitter/nvim-treesitter/issues/4945
	--use {'nvim-treesitter/nvim-treesitter', commit = '33eb472b459f1d2bf49e16154726743ab3ca1c6d'}
	use("mhartington/formatter.nvim")
	use({
		"epwalsh/obsidian.nvim",
		tag = "*", -- recommended, use latest release instead of latest commit
		requires = {
			-- Required.
			"nvim-lua/plenary.nvim",
		},
	})
	use("uga-rosa/translate.nvim")
end)
