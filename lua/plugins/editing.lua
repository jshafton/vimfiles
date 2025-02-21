return {
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				surrounds = {
					["h"] = {
						add = { "{{", "}}" },
						find = "{{.-}}",
						delete = "^({{)().-(}})()$",
					},
				}, -- Defines surround keys and behavior
			})
		end,
	},

	{
		"tpope/vim-unimpaired",
		lazy = false,
	},

	{ "tpope/vim-repeat", lazy = false },
	{ "vim-scripts/ReplaceWithRegister", lazy = false },

	{
		"windwp/nvim-autopairs",
		config = function()
			local npairs = require("nvim-autopairs")
			local endwise = require("nvim-autopairs.ts-rule").endwise

			npairs.setup({
				disable_filetype = { "TelescopePrompt", "vim" },
				disable_in_macro = false, -- disable when recording or executing a macro
				disable_in_visualblock = false, -- disable when insert after visual block mode
				ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
				enable_moveright = true,
				enable_afterquote = true, -- add bracket pairs after quote
				enable_check_bracket_line = true, --- check bracket in same line
				check_ts = false,
				map_bs = true, -- map the <BS> key
				map_c_h = false, -- Map the <C-h> key to delete a pair
				map_c_w = false, -- map <c-w> to delete a pair if possible
				map_cr = true,
				map_complete = true,
			})

			-- Built-in endwise rules
			npairs.add_rules(require("nvim-autopairs.rules.endwise-lua"))
			npairs.add_rules(require("nvim-autopairs.rules.endwise-ruby"))

			-- Bash endwise rules
			npairs.add_rules({
				endwise("if%s.+then$", "fi", "sh", nil),
				endwise("%sif%s.+then$", "fi", "sh", nil),
				endwise("case%s.+$", "esac", "sh", nil),
				endwise("%scase%s.+$", "esac", "sh", nil),
				endwise("%sdo$", "done", "sh", nil),
			})
		end,
		lazy = false,
	},

	{ "axelf4/vim-strip-trailing-whitespace", lazy = false },
	{ "dhruvasagar/vim-table-mode", ft = { "markdown" } },

	-- ar, ir
	-- { "nelstrom/vim-textobj-rubyblock", ft = { "ruby" } },
	-- https://github.com/chrisgrieser/nvim-various-textobjs?tab=readme-ov-file#list-of-text-objects
	{
		"chrisgrieser/nvim-various-textobjs",
		opts = {
			keymaps = {
				useDefaults = true,
				disabledDefaults = { "gG" },
			},
		},
		keys = {
			{ "ie", "<cmd>lua require('various-textobjs').entireBuffer()<CR>", mode = { "o", "x" } },
		},
		lazy = false,
	},

	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = {
			"nvim-treesitter-textobjects",
			"nvim-treesitter/nvim-treesitter",
		},
		lazy = false,
		config = function()
			require("nvim-treesitter.configs").setup({
				textobjects = {
					select = {
						enable = true,
						-- Automatically jump forward to textobj, similar to targets.vim
						lookahead = true,
						keymaps = {
							-- You can use the capture groups defined in textobjects.scm
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
						},
					},
					move = {
						enable = true,
						set_jumps = true, -- whether to set jumps in the jumplist
						goto_next_start = {
							["]m"] = "@function.outer",
							["]]"] = "@class.outer",
						},
						goto_next_end = {
							["]M"] = "@function.outer",
							["]["] = "@class.outer",
						},
						goto_previous_start = {
							["[m"] = "@function.outer",
							["[["] = "@class.outer",
						},
						goto_previous_end = {
							["[M"] = "@function.outer",
							["[]"] = "@class.outer",
						},
					},
					lsp_interop = {
						enable = true,
						border = "none",
						peek_definition_code = {
							["<leader>df"] = "@function.outer",
							["<leader>dF"] = "@class.outer",
						},
					},
				},
			})
		end,
	},

	-- https://github.com/wellle/targets.vim/blob/master/cheatsheet.md
	{ "wellle/targets.vim", lazy = false },

	-- Movement through camel case and snake case words
	{
		"bkad/CamelCaseMotion",
		config = function()
			vim.cmd([[ call camelcasemotion#CreateMotionMappings('<leader>') ]])
		end,
		lazy = false,
	},

	{
		"junegunn/vim-easy-align",
		keys = {
			{ "g=", "<Plug>(EasyAlign)", mode = { "n" } },
			{ "g=", "<Plug>(LiveEasyAlign)", mode = { "v" } },
		},
		cmd = {
			"EasyAlign",
			"LiveEasyAlign",
		},
	},

	{
		"tpope/vim-abolish",
		cmd = {
			"S",
			"Subvert",
		},
		lazy = false,
	},

	{ "tpope/vim-eunuch", lazy = false },

	{
		"simnalamburt/vim-mundo",
		keys = {
			{ "F5", "<call>MundoToggle<CR>" },
		},
		cmd = "MundoToggle",
	},

	{
		"nvim-pack/nvim-spectre",
		config = true,
		opts = {
			mapping = {
				["send_to_qf"] = {
					map = "<C-q>",
					cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
					desc = "send all item to quickfix",
				},
			},
		},
		keys = {
			{ "<leader>r", "<cmd>lua require('spectre').open_file_search({select_word=true})<CR>", mode = { "n" } },
			{ "<leader>R", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", mode = { "n" } },
			{ "<leader>S", "<cmd>lua require('spectre').open()<CR>", mode = { "n" } },
		},
	},

	{
		"MagicDuck/grug-far.nvim",
		opts = {
			keymaps = {
				replace = { n = "gr" },
				qflist = { n = "gq" },
				syncLocations = { n = "gs" },
				syncLine = { n = "gl" },
				close = { n = "gc" },
				historyOpen = { n = "gt" },
				historyAdd = { n = "ga" },
				refresh = { n = "gf" },
				gotoLocation = { n = "<enter>" },
				pickHistoryEntry = { n = "<enter>" },
			},
		},
	},

	{
		"gabrielpoca/replacer.nvim",
	},

	{
		"kevinhwang91/nvim-bqf",
		ft = "qf",
		dependencies = {
			"junegunn/fzf",
			"junegunn/fzf.vim",
		},
		opts = {
			auto_enable = true,
		},
	},

	{
		"johmsalas/text-case.nvim",
		config = true,
	},

	{
		"sk1418/Join",
	},

	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<space>f",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
			{ "<leader>tf", "<cmd>ToggleFormat<CR>" },
		},
		-- Everything in opts will be passed to setup()
		opts = {
			-- Define your formatters
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { { "prettierd", "prettier" } },
				sh = { { "shfmt", "shellcheck" } },
				terraform = { "terraform_fmt" },
				packer = { "packerfmt" },
				hcl = { "hclfmt" },
				yaml = { "yamlfmt" },
				ruby = { "rubocop" },
			},
			-- Set up format-on-save
			format_on_save = function(bufnr)
				-- Stop if we disabled auto-formatting.
				if not vim.g.autoformat then
					return nil
				end

				-- Disable autoformat on certain filetypes
				local ignore_filetypes = { "dockerfile", "yaml", "yaml.ansible" }
				if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
					return
				end
				-- Disable with a global or buffer-local variable
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end

				return { timeout_ms = 500, lsp_fallback = true }
			end,
			-- Customize formatters
			formatters = {
				shfmt = {
					prepend_args = { "-i", "2" },
				},
				hclfmt = {
					command = "terraform",
					args = { "fmt", "-" },
				},
				packerfmt = {
					command = "packer",
					args = { "fmt", "-" },
				},
			},
		},
		init = function()
			-- If you want the formatexpr, here is the place to set it
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

			vim.api.nvim_create_user_command("ToggleFormat", function()
				vim.g.autoformat = not vim.g.autoformat
				vim.notify(
					string.format("%s formatting...", vim.g.autoformat and "Enabling" or "Disabling"),
					vim.log.levels.INFO
				)
			end, { desc = "Toggle conform.nvim auto-formatting", nargs = 0 })

			-- Start auto-formatting by default (and disable with my ToggleFormat command).
			vim.g.autoformat = true
		end,
	},
}
