return {
	{ "zimbatm/haproxy.vim" },
	{ "stephpy/vim-yaml", ft = "yaml" },
	{ "kchmck/vim-coffee-script", ft = "coffee" },
	{ "slim-template/vim-slim", ft = "slim" },
	{ "hashivim/vim-terraform", ft = "terraform" },
	{ "towolf/vim-helm", ft = "helm" },
	{ "martinda/Jenkinsfile-vim-syntax" },

	{
		"cuducos/yaml.nvim",
		ft = { "yaml" }, -- optional
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-telescope/telescope.nvim", -- optional
		},
		keys = {
			{ "<leader>yk", "<cmd>YAMLYankKey<CR>", mode = "n", { silent = false } }, -- yank yaml key
			{ "<leader>yv", "<cmd>YAMLYankKey<CR>", mode = "n", { silent = false } }, -- yank yaml value
		},
	},
}
