local diagnostics_icons = {
	Error = " ",
	Warn = " ",
	Hint = " ",
	Info = " ",
}

return {
	{
		{
			"neovim/nvim-lspconfig",
			event = { "BufReadPre", "BufNewFile" },
			dependencies = {
				"mason.nvim",
				"williamboman/mason-lspconfig.nvim",
				"hrsh7th/cmp-nvim-lsp",
			},
			---@class PluginLspOpts
			opts = {
				-- options for vim.diagnostic.config()
				diagnostics = {
					underline = true,
					update_in_insert = false,
					virtual_text = { spacing = 4, prefix = "●" },
					severity_sort = true,
				},
				-- Automatically format on save
				autoformat = true,
				-- options for vim.lsp.buf.format
				-- `bufnr` and `filter` is handled by the LazyVim formatter,
				-- but can be also overridden when specified
				format = {
					formatting_options = nil,
					timeout_ms = nil,
				},
				-- LSP Server Settings
				servers = {
					bashls = {},
					jsonls = {},
					tsserver = {},
					groovyls = {},
					yamlls = {
						settings = {
							yaml = {
								schemas = {
									["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.22.1-standalone/all.json"] = "k8s**/*",
									["https://raw.githubusercontent.com/ansible/schemas/main/f/ansible.json"] = "*ansible**/*",
								},
								format = {
									enable = true,
								},
							},
						},
						on_attach = function(_, bufnr)
							if vim.bo[bufnr].buftype ~= "" or vim.bo[bufnr].filetype == "helm" then
								vim.diagnostic.disable()
							end
						end,
					},
					lua_ls = {
						-- mason = false, -- set to false if you don't want this server to be installed with mason
						settings = {
							Lua = {
								workspace = {
									checkThirdParty = false,
								},
								diagnostics = {
									-- Get the language server to recognize the `vim` global
									globals = { "vim", "use" },
								},
								completion = {
									callSnippet = "Replace",
								},
							},
						},
					},
					dockerls = {},
					solargraph = {
						flags = {
							debounce_text_changes = 150,
						},
						init_options = {
							formatting = true,
						},
					},
					jedi_language_server = {},
					terraformls = {},
					tflint = {},
				},
				-- you can do any additional lsp server setup here
				-- return true if you don't want this server to be setup with lspconfig
				setup = {
					-- example to setup with typescript.nvim
					-- tsserver = function(_, opts)
					--   require("typescript").setup({ server = opts })
					--   return true
					-- end,
					-- Specify * to use this function as a fallback for any server
					-- ["*"] = function(server, opts) end,
				},
			},
			---@param opts PluginLspOpts
			config = function(_, opts)
				-- diagnostics
				for name, icon in pairs(diagnostics_icons) do
					name = "DiagnosticSign" .. name
					vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
				end
				vim.diagnostic.config(opts.diagnostics)

				local servers = opts.servers
				local capabilities =
					require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

				local function setup(server)
					local server_opts = vim.tbl_deep_extend("force", {
						capabilities = vim.deepcopy(capabilities),
					}, servers[server] or {})

					if opts.setup[server] then
						if opts.setup[server](server, server_opts) then
							return
						end
					elseif opts.setup["*"] then
						if opts.setup["*"](server, server_opts) then
							return
						end
					end
					require("lspconfig")[server].setup(server_opts)
				end

				-- temp fix for lspconfig rename
				-- https://github.com/neovim/nvim-lspconfig/pull/2439
				local mappings = require("mason-lspconfig.mappings.server")
				if not mappings.lspconfig_to_package.lua_ls then
					mappings.lspconfig_to_package.lua_ls = "lua-language-server"
					mappings.package_to_lspconfig["lua-language-server"] = "lua_ls"
				end

				local mlsp = require("mason-lspconfig")
				local available = mlsp.get_available_servers()

				local ensure_installed = {} ---@type string[]
				for server, server_opts in pairs(servers) do
					if server_opts then
						server_opts = server_opts == true and {} or server_opts
						-- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
						if server_opts.mason == false or not vim.tbl_contains(available, server) then
							setup(server)
						else
							ensure_installed[#ensure_installed + 1] = server
						end
					end
				end

				require("mason-lspconfig").setup({ ensure_installed = ensure_installed })
				require("mason-lspconfig").setup_handlers({ setup })
			end,
			keys = {
				{ "<space>f", "<cmd>lua vim.lsp.buf.format { async = true }<CR>", mode = { "n", "v" } },
				{ "<space>,", "<cmd>Lspsaga diagnostic_jump_prev<CR>" },
				{ "<space>;", "<cmd>Lspsaga diagnostic_jump_next<CR>" },
				{ "<space>h", "<cmd>Lspsaga hover_doc<CR>" },
				{ "<space>l", "<cmd>Lspsaga show_line_diagnostics<CR>" },
				{ "<space>a", "<cmd>Lspsaga code_action<CR>" },
				{ "<space>d", "<cmd>Lspsaga peek_definition<CR>" },
				{ "<space>s", "<cmd>Lspsaga outline<CR>" },
				{ "<space>m", "<cmd>Lspsaga rename<CR>" },
			},
		},
	},

	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
		opts = {
			ensure_installed = {
				"stylua",
				"shellcheck",
				"shfmt",
				"flake8",
				"yamllint",
			},
		},
		config = function(_, opts)
			require("mason").setup(opts)
			local mr = require("mason-registry")
			for _, tool in ipairs(opts.ensure_installed) do
				local p = mr.get_package(tool)
				if not p:is_installed() then
					p:install()
				end
			end
		end,
	},

	{
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = true,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	{
		"folke/trouble.nvim",
		branch = "main",
		opts = {
			position = "bottom", -- position of the list can be: bottom, top, left, right
			height = 10, -- height of the trouble list when position is top or bottom
			width = 50, -- width of the list when position is left or right
			icons = true, -- use devicons for filenames
			mode = "document_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
			fold_open = "", -- icon used for open folds
			fold_closed = "", -- icon used for closed folds
			group = true, -- group results by file
			padding = true, -- add an extra new line on top of the list
			action_keys = {
				-- key mappings for actions in the trouble list
				-- map to {} to remove a mapping, for example:
				-- close = {},
				close = "q", -- close the list
				cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
				refresh = "r", -- manually refresh
				jump = { "<cr>", "<tab>" }, -- jump to the diagnostic or open / close folds
				open_split = { "<c-x>" }, -- open buffer in new split
				open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
				open_tab = { "<c-t>" }, -- open buffer in new tab
				jump_close = { "o" }, -- jump to the diagnostic and close the list
				toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
				toggle_preview = "P", -- toggle auto_preview
				hover = "K", -- opens a small popup with the full multiline message
				preview = "p", -- preview the diagnostic location
				close_folds = { "zM", "zm" }, -- close all folds
				open_folds = { "zR", "zr" }, -- open all folds
				toggle_fold = { "zA", "za" }, -- toggle fold of current file
				previous = "k", -- preview item
				next = "j", -- next item
			},
			indent_lines = true, -- add an indent guide below the fold icons
			auto_open = false, -- automatically open the list when you have diagnostics
			auto_close = false, -- automatically close the list when you have no diagnostics
			auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
			auto_fold = false, -- automatically fold a file trouble list at creation
			auto_jump = { "lsp_definitions" }, -- for the given modes, automatically jump if there is only a single result
			signs = {
				-- icons / text used for a diagnostic
				error = "",
				warning = "",
				hint = "",
				information = "",
				other = "﫠",
			},
			use_diagnostic_signs = true, -- enabling this will use the signs defined in your lsp client
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{ "†", "<cmd>TroubleToggle<CR>" }, -- alt-t
		},
	},

	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "mason.nvim", "jose-elias-alvarez/null-ls.nvim" },
		config = function()
			require("mason-null-ls").setup({
				ensure_installed = {
					"shellcheck",
					"shfmt",
					"terraform_fmt",
					"yamlfmt",
					"actionlint",
					"npm_groovy_lint",
				},
				automatic_installation = true,
				automatic_setup = true,
			})
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					-- Anything not supported by mason.
					null_ls.builtins.formatting.terraform_fmt.with({
						extra_filetypes = { "hcl" },
					}),
					null_ls.builtins.diagnostics.npm_groovy_lint.with({
						env = {
							PATH = "/opt/homebrew/opt/openjdk@11/bin:$PATH",
						},
					}),
				},
			})
		end,
	},

	{
		"WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
		keys = {
			{ "Î", "<cmd>ToggleDiag<CR>" }, -- alt-shift-d
		},
		config = function()
			require("toggle_lsp_diagnostics").init()
		end,
	},
}
