return {
	"folke/snacks.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"echasnovski/mini.icons",
	},
	priority = 1000,
	lazy = false,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		bigfile = { enabled = true },
		dashboard = { enabled = true },
		explorer = { enabled = true },
		indent = {
			enabled = true,
			animate = {
				enabled = false,
			},
		},
		input = { enabled = true },
		picker = {
			enabled = true,
			previewers = {
				git = {
					builtin = false, -- use native (terminal) or Neovim for previewing git diffs and commits
				},
			},
			win = {
				input = {
					keys = {
						["<c-t>"] = { "edit_tab", mode = { "i", "n" } },
						["∂"] = { "inspect", mode = { "n", "i" } },
						["ƒ"] = { "toggle_follow", mode = { "i", "n" } },
						["˙"] = { "toggle_hidden", mode = { "i", "n" } },
						["ˆ"] = { "toggle_ignored", mode = { "i", "n" } },
						["µ"] = { "toggle_maximize", mode = { "i", "n" } },
						["π"] = { "toggle_preview", mode = { "i", "n" } },
						["¥"] = { "yank", mode = { "i", "n" } },
					},
				},
				list = {
					keys = {
						["∂"] = { "inspect", mode = { "n", "i" } },
						["ƒ"] = { "toggle_follow", mode = { "i", "n" } },
						["˙"] = { "toggle_hidden", mode = { "i", "n" } },
						["ˆ"] = { "toggle_ignored", mode = { "i", "n" } },
						["µ"] = { "toggle_maximize", mode = { "i", "n" } },
						["π"] = { "toggle_preview", mode = { "i", "n" } },
					},
				},
			},
			formatters = {
				file = {
					filename_first = false, -- display filename before the file path
					truncate = 80, -- truncate the file path to (roughly) this length
					filename_only = false, -- only show the filename
					icon_width = 2, -- width of the icon (in characters)
					git_status_hl = true, -- use the git status highlight group for the filename
				},
			},
		},
		notifier = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },

		scroll = { enabled = false },
		statuscolumn = { enabled = false },
		words = { enabled = false },
	},
	keys = {
    ---------------------------------------------
    -- find files
    ---------------------------------------------
		{ "<C-p>", function() Snacks.picker.smart() end, desc = "Smart Find Files", },
    { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File", },
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files", },
    { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files", },
    { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects", },
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent", },
		{ "ƒ", function() Snacks.explorer() end, desc = "File Explorer", },
    -- alt-b
		{ "∫", function() Snacks.picker.buffers() end, desc = "Buffers", },

    ---------------------------------------------
		-- git
    ---------------------------------------------
		{ "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches", },
		{ "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log", },
		{ "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line", },
		-- { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status", },
		{ "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash", },
		-- { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)", },
		{ "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File", },

    ---------------------------------------------
		-- Grep
    ---------------------------------------------
		{
			"<C-f>",
			function()
				Snacks.picker.grep({
					args = {"--smart-case"}
				})
			end,
			desc = "Grep",
		},

		{ "¬", function() Snacks.picker.lines() end, desc = "Buffer Lines", },
		{ "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers", },
		{ "<space>r", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" }, },

    ---------------------------------------------
		-- search
    ---------------------------------------------
		{ '<leader>s"', function() Snacks.picker.registers() end, desc = "Registers", },
		{ "<leader>s/", function() Snacks.picker.search_history() end, desc = "Search History", },
		{ "<leader>sa", function() Snacks.picker.autocmds() end, desc = "Autocmds", },
		{ "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines", },
		{ "<leader>sc", function() Snacks.picker.command_history() end, desc = "Command History", },
		{ "<leader>sC", function() Snacks.picker.commands() end, desc = "Commands", },
		{ "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics", },
		{ "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics", },
		{ "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages", },
		{ "<leader>sH", function() Snacks.picker.highlights() end, desc = "Highlights", },
		{ "<leader>si", function() Snacks.picker.icons() end, desc = "Icons", },
		{ "<leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps", },
		{ "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps", },
		{ "<leader>sl", function() Snacks.picker.loclist() end, desc = "Location List", },
		{ "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks", },
		{ "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages", },
		{ "<leader>sp", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec", },
		{ "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List", },
		{ "®", function() Snacks.picker.resume() end, desc = "Resume", },
		{ "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History", },
		{ "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes", },
    -- alt-c
    { "ç", function() Snacks.picker.command_history() end, desc = "Command History", },
    -- alt-shift-c
    { "Ç", function() Snacks.picker.commands() end, desc = "Commands", },
    -- alt-h
    { "˙", function() Snacks.picker.help() end, desc = "Help Pages", },
    { "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History", },

    ---------------------------------------------
		-- LSP
    ---------------------------------------------
		{ "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition", },
		{ "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration", },
		{ "gR", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References", },
		{ "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation", },
		{ "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition", },
		{ "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols", },
		{ "«", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols", }, -- alt-\
		{ "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols", },

    ---------------------------------------------
		-- Other
    ---------------------------------------------
		{ "<leader>z", function() Snacks.zen() end, desc = "Toggle Zen Mode", },
    -- "focus"
		{ "<leader>Z", function() Snacks.zen.zoom() end, desc = "Toggle Zoom", },
		{ "<leader>.", function() Snacks.scratch() end, desc = "Toggle Scratch Buffer", },
		{ "<leader>S", function() Snacks.scratch.select() end, desc = "Select Scratch Buffer", },
		{ "<leader>n", function() Snacks.notifier.show_history() end, desc = "Notification History", },
		{ "<c-x>", function() Snacks.bufdelete() end, desc = "Delete Buffer", },
		{ "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File", },
		{ "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" }, },
		{ "<leader>gz", function() Snacks.lazygit() end, desc = "Lazygit", },
		{ "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications", },
		{ "<c-/>", function() Snacks.terminal() end, desc = "Toggle Terminal", },
		{ "<c-_>", function() Snacks.terminal() end, desc = "which_key_ignore", },
		{ "]]", function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" }, },
		{ "[[", function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" }, },
		{
			"<leader>N",
			desc = "Neovim News",
			function()
				Snacks.win({
					file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
					width = 0.6,
					height = 0.6,
					wo = {
						spell = false,
						wrap = false,
						signcolumn = "yes",
						statuscolumn = " ",
						conceallevel = 3,
					},
				})
			end,
		},
	},
}
