return {
	"mfussenegger/nvim-lint",
	dependencies = {
		"williamboman/mason.nvim",
		"rshkarin/mason-nvim-lint",
	},
	event = { "BufWritePost" },
	config = function()
		require("mason-nvim-lint").setup()

		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})

		require("lint").linters_by_ft = {
			json = { "jsonlint" },
			ghaworkflow = { "actionlint" },
		}
	end,
}
