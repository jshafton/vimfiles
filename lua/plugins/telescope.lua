return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-live-grep-args.nvim",
			"molecule-man/telescope-menufacture",
		},
		config = function()
			local telescope = require("telescope")
			local lga = require("telescope-live-grep-args.actions")

			telescope.setup({
				defaults = {
					layout_strategy = "flex",
					layout_config = {
						vertical = {
							prompt_position = "top",
							mirror = true,
						},
					},
				},
				pickers = {
					find_files = {
						hidden = true,
					},
					live_grep = {
						mappings = {
							i = {
								["<C-f>"] = require("telescope.actions").to_fuzzy_refine,
							},
						},
					},
				},
				extensions = {
					live_grep_args = {
						auto_quoting = true, -- enable/disable auto-quoting
						-- define mappings, e.g.
						mappings = { -- extend mappings
							i = {
								["<C-k>"] = lga.quote_prompt(),
								["<C-i>"] = lga.quote_prompt({
									postfix = " --iglob ",
								}),
							},
						},
					},
					menufacture = {
						mappings = {
							i = {
								["<C-/>"] = telescope.extensions.menufacture.menu_actions.search_in_directory.action,
							},
						},
					},
				},
			})

			telescope.load_extension("fzf")
			telescope.load_extension("neoclip")
			telescope.load_extension("telescope-tabs")
			telescope.load_extension("menufacture")
		end,
		keys = {
			{ "<C-p>", "<cmd>lua require('telescope').extensions.menufacture.git_files({ show_untracked = true})<CR>" },
			-- alt-r "resume"
			{ "®", "<cmd>Telescope resume<CR>" },
			-- alt-b
			{ "∫", "<cmd>Telescope buffers<CR>" },
			-- alt-w "window"
			{ "∑", "<cmd>Telescope telescope-tabs list_tabs<CR>" },
			-- alt-l
			{ "¬", "<cmd>Telescope current_buffer_fuzzy_find<CR>" },
			-- "find"
			{
				"<C-f>",
				'<cmd>lua require("telescope.builtin").grep_string{ shorten_path = true, word_match = "-w", only_sort_text = true, search = "" }<CR>',
			},
			-- alt-f "find" including file path
			{
				"ƒ",
				':lua require("telescope").extensions.menufacture.live_grep()<CR>',
			},
			-- alt-o "old files"
			{ "ø", "<cmd>Telescope oldfiles<CR>" },
			-- alt-v for paste
			{ "√", "<cmd>Telescope neoclip<CR>" },
			-- alt-shift-c "changes"
			{ "Ç", "<cmd>AdvancedGitSearch diff_commit_file<CR>" },
			-- alt-c "commands"
			{ "ç", "<cmd>Telescope commands<CR>" },
			-- alt-m "maps"
			{ "µ", "<cmd>Telescope keymaps<CR>" },
			-- alt-h "help tags"
			{ "˙", "<cmd>Telescope help_tags<CR>" },
			-- "references"
			{ "<space>r", ":lua require('telescope').extensions.menufacture.live_grep()<CR>" },
			-- alt-shift-f "file types"
			{ "Ï", "<cmd>Telescope filetypes<CR>" },
			{ "<space>R", "<cmd>Telescope lsp_referencess<CR>" },
		},
	},

	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},

	{
		"LukasPietzschmann/telescope-tabs",
		config = true,
		dependencies = { "nvim-telescope/telescope.nvim" },
	},

	{
		"aaronhallaert/advanced-git-search.nvim",
		config = function()
			require("telescope").load_extension("advanced_git_search")
		end,
		dependencies = {
			"nvim-telescope/telescope.nvim",
			-- to show diff splits and open commits in browser
			"tpope/vim-fugitive",
			-- to open commits in browser with fugitive
			"tpope/vim-rhubarb",
			-- optional: to replace the diff from fugitive with diffview.nvim
			-- (fugitive is still needed to open in browser)
			"sindrets/diffview.nvim",
		},
	},
}
