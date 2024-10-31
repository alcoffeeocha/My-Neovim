local status, translate = pcall(require, 'translate')
if (not status) then
	return
end

translate.setup({
	default = {
		command = "translate_shell",
		output = "replace",
	},
})
