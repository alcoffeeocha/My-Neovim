local status, devicons = pcall(require, "nvim-web-devicons")
if (not status) then return end

devicons.setup({
	strict = true,
	override_by_extension = {
		astro = {
			icon = "",
			color = "#EF8547",
			name = "astro",
		},
	},
})
