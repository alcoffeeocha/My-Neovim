local hl = vim.api.nvim_set_hl
local diagnosticBg = "none"

require('kanagawa').setup({
	compile = false,  -- enable compiling the colorscheme
	undercurl = false, -- enable undercurls
	commentStyle = { italic = true },
	functionStyle = {},
	keywordStyle = { italic = true },
	statementStyle = { bold = true },
	typeStyle = {},
	transparent = false,  -- do not set background color
	dimInactive = false,  -- dim inactive window `:h hl-NormalNC`
	terminalColors = true, -- define vim.g.terminal_color_{0,17}
	colors = {            -- add/modify theme and palette colors
		palette = {},
		theme = {
			wave = {},
			lotus = {},
			dragon = {},
			all = {
				ui = {
					bg_gutter = "none"
				}
			}
		},
	},
	overrides = function(colors) -- add/modify highlights
		local theme = colors.theme
		local palette = colors.palette
		return {
			--Normal = { bg = "none" },
			--NormalFloat = { bg = "none" },
			--FloatBorder = { bg = "none" },
			--FloatTitle = { bg = "none" },
			ColorColumn = { ctermbg = 0, bg = "none" },
			TSGroup = { link = "@group" },
			-- Save an hlgroup with dark background and dimmed foreground
			-- so that you can use it where your still want darker windows.
			-- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
			NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
			DiagnosticError = { fg = palette.samuraiRed, bg = diagnosticBg },
			DiagnosticSignError = { fg = palette.samuraiRed, bg = diagnosticBg },
			DiagnosticSignHint = { fg = palette.dragonBlue, bg = diagnosticBg },
			DiagnosticSignInfo = { fg = palette.waveAqua1, bg = diagnosticBg },
			DiagnosticSignWarn = { fg = palette.roninYellow, bg = diagnosticBg },

			-- Popular plugins that open floats will link to NormalFloat by default;
			-- set their background accordingly if you wish to keep them dark and borderless
			LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
			MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
			TelescopeTitle = { fg = theme.ui.special, bold = true },
			TelescopePromptNormal = { bg = theme.ui.bg_p1 },
			TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
			TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
			TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
			TelescopePreviewNormal = { bg = theme.ui.bg_dim },
			TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
			Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
			PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
			PmenuSbar = { bg = theme.ui.bg_m1 },
			PmenuThumb = { bg = theme.ui.bg_p2 },
		}
	end,
	theme = "wave",  -- Load "wave" theme when 'background' option is not set
	background = {   -- map the value of 'background' option to a theme
		dark = "dragon", -- wave | dragon
		light = "lotus"
	},
})
vim.cmd.colorscheme("kanagawa")
vim.o.background = "dark"

-- use this function if want to activate rose-pine or palenightfall or gruvbox
function ColorMyPencils(color)
	--color = color or "rose-pine"
	color = "palenightfall"
	--color = "gruvbox"
	vim.cmd.colorscheme(color)
	vim.o.background = "dark"
	hl(0, "Normal", { bg = "none" })
	hl(0, "NormalFloat", { bg = "none" })
	hl(0, "ColorColumn", { ctermbg = 0, bg = "none" })
	-- LSP
	hl(0, "DiagnosticError", { fg = "#FF0000", bg = diagnosticBg })
	hl(0, "DiagnosticSignError", { fg = "#FF0000", bg = diagnosticBg })
	hl(0, "DiagnosticSignHint", { fg = "#00FFFF", bg = diagnosticBg })
	hl(0, "DiagnosticSignInfo", { fg = "#FFFFFF", bg = diagnosticBg })
	hl(0, "DiagnosticSignWarn", { fg = "#FFFF00", bg = diagnosticBg })
	hl(0, "TSGroup", { link = "@group" })
	vim.cmd "hi signcolumn guibg=none"
end

--ColorMyPencils()
