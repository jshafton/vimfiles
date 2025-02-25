return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = false, -- last release is way too old and doesn't work on Windows
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			ensure_installed = {
				"bash",
				"gitcommit",
				"go",
				"hcl",
				"html",
				"java",
				"javascript",
				"jsdoc",
				"json",
				"json5",
				"jsonc",
				"lua",
				"make",
				"markdown",
				"markdown_inline",
				"python",
				"regex",
				"ruby",
				"scala",
				"toml",
				"vim",
				"yaml",
				"git_rebase",
				"gitignore",
				"groovy",
				"helm",
				"jinja",
				"jinja_inline",
				"sql",
				"ssh_config",
				"terraform",
				"tmux",
			},
			highlight = {
				enable = true,
				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
				-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
				-- Using this option may slow down your editor, and you may see some duplicate highlights.
				-- Instead of true it can also be a list of languages
				additional_vim_regex_highlighting = false, -- { 'ansible', 'yaml' },
				disable = { "yaml", "ansible" },
			},
			indent = {
				enable = false,
				disable = { "yaml" },
			},
			endwise = {
				enabled = true,
			},
			matchup = {
				enable = true, -- mandatory, false will disable the whole extension
				-- disable = { "c", "ruby" }, -- optional, list of language that will be disabled
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
