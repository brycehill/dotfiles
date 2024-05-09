-- Markdown preview
return {
	"ellisonleao/glow.nvim",
	config = function()
		require("glow").setup({
			width_ratio = 0.8,
			height_ratio = 0.8,
		})
	end,
}
