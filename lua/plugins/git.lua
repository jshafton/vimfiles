return {
	{
		"tpope/vim-fugitive",
		keys = {
			-- { "<leader>gs", "<cmd>Git<CR>" },
			{ "<leader>gc", "<cmd>Git commit<CR>" },
			{ "<leader>gca", "<cmd>Git commit --amend<CR>" },
			{ "<leader>gb", "<cmd>Git blame<CR>" },
			{ "<leader>gd", "<cmd>Gdiffsplit<CR>" },
			{ "<leader>gr", "<cmd>Gread<CR>" },
			{ "<leader>grm", "<cmd>Gread master:%<CR>" },
			{ "<leader>gw", "<cmd>Gwrite<CR>" },
			{ "<leader>gp", "<cmd>Git push<CR>" },
			{ "<leader>gpf", "<cmd>Git push --force<CR>" },
			{ "<leader>gpsu", "<cmd>! git push -u origin $(git rev-parse --abbrev-ref HEAD)<CR>" },
			{ "<leader>grb", "<cmd>! git pull --rebase<CR>" },
			{ "<leader>ga", '<cmd>! git add .<CR> " adds everything to the index' },
			{ "<leader>grh", '<cmd>! git reset .<CR> " git reset head -- unstages everything' },
			{
				"<leader>gpr",
				"<cmd>! git push -u origin $(git rev-parse --abbrev-ref HEAD) && hub pull-request --no-edit -o<CR>",
			}, -- git 'pull request' to finish up a PR
		},
	},

	{ "tpope/vim-rhubarb" },

	{
		"lewis6991/gitsigns.nvim",
		lazy = false,
		dependencies = "nvim-lua/plenary.nvim",
		opts = {
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map("n", "]c", function()
					if vim.wo.diff then
						return "]c"
					end
					vim.schedule(function()
						gs.next_hunk()
					end)
					return "<Ignore>"
				end, { expr = true })

				map("n", "[c", function()
					if vim.wo.diff then
						return "[c"
					end
					vim.schedule(function()
						gs.prev_hunk()
					end)
					return "<Ignore>"
				end, { expr = true })

				-- Actions
				map("n", "<leader>hs", gs.stage_hunk)
				map("n", "<leader>hr", gs.reset_hunk)
				map("v", "<leader>hs", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end)
				map("v", "<leader>hr", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end)
				map("n", "<leader>hS", gs.stage_buffer)
				map("n", "<leader>hu", gs.undo_stage_hunk)
				map("n", "<leader>hR", gs.reset_buffer)
				map("n", "<leader>hp", gs.preview_hunk)
				map("n", "<leader>hb", function()
					gs.blame_line({ full = true })
				end)
				map("n", "<leader>tb", gs.toggle_current_line_blame)
				map("n", "<leader>hd", gs.diffthis)
				map("n", "<leader>hD", function()
					gs.diffthis("~")
				end)
				map("n", "<leader>td", gs.toggle_deleted)

				-- Text object
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
			end,
		},
	},

	{
		"rhysd/git-messenger.vim",
		keys = {
			{ "<space>g", "<cmd>GitMessenger<CR>" },
		},
		init = function()
			vim.g.git_messenger_no_default_mappings = true
			vim.g.git_messenger_include_diff = "curent"
			vim.g.git_messenger_always_into_popup = true
		end,
	},

	{
		"ruifm/gitlinker.nvim",
		keys = {
			{
				"<leader>gy",
				'<cmd>lua require("gitlinker").get_buf_range_url("n")<CR>',
				mode = "n",
				{ silent = false },
			}, -- copy github link
			{
				"<leader>gy",
				'<cmd>lua require("gitlinker").get_buf_range_url("v")<CR><ESC>',
				mode = "v",
				{ silent = false },
			}, -- copy github link
		},
		dependencies = "nvim-lua/plenary.nvim",
	},

	{
		"sindrets/diffview.nvim",
		keys = {
			{ "©", "<cmd>DiffviewOpen<CR>" },
		},
	},

	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional
		},
		keys = {
			{ "<leader>gZ", "<cmd>Neogit<CR>" },
		},
		opts = {
			commit_editor = {
				kind = "split",
			},
			integrations = {
				-- If enabled, use telescope for menu selection rather than vim.ui.select.
				-- Allows multi-select and some things that vim.ui.select doesn't.
				telescope = nil,
				-- Neogit only provides inline diffs. If you want a more traditional way to look at diffs, you can use `diffview`.
				-- The diffview integration enables the diff popup.
				--
				-- Requires you to have `sindrets/diffview.nvim` installed.
				diffview = true,

				-- If enabled, uses fzf-lua for menu selection. If the telescope integration
				-- is also selected then telescope is used instead
				-- Requires you to have `ibhagwan/fzf-lua` installed.
				-- fzf_lua = true,
			},
		},
	},
}
