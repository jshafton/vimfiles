return {
	"EdenEast/nightfox.nvim",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	opts = {
		options = {
			transparent = true,
			dim_inactive = true,
			styles = {
				comments = "italic",
				functions = "bold",
			},
		},
	},
	init = function()
		-- load the colorscheme here
		vim.cmd([[colorscheme nordfox]])
	end,
}
