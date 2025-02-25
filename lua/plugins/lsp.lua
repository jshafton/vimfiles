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
				-- LSP Server Settings
				servers = {
					bashls = {},
					jsonls = {},
					ts_ls = {},
					groovyls = {},
					yamlls = {
						settings = {
							yaml = {
								schemas = {
									["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.22.1-standalone/all.json"] = "*k8s**/*",
									["https://raw.githubusercontent.com/ansible/schemas/main/f/ansible.json"] = "*ansible**/*",
									["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
									["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
									["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
									["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
									["http://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
									["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
									["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
									["https://json.schemastore.org/gitlab-ci"] = "*gitlab-ci*.{yml,yaml}",
									["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
									["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
									["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
								},
							},
						},
						-- on_attach = function(_, bufnr)
						-- 	if vim.bo[bufnr].buftype ~= "" or vim.bo[bufnr].filetype == "helm" then
						-- 		vim.diagnostic.disable()
						-- 	end
						-- end,
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
					jedi_language_server = {},
					terraformls = {},
					tflint = {},
					helm_ls = {
						yamlls = {
							path = "yaml-language-server",
						},
					},
					coffeesense = {},
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

				local lsp_config = require("lspconfig")
				lsp_config.solargraph.setup({
					cmd = { os.getenv("HOME") .. "/.asdf/shims/solargraph", "stdio" },
					root_dir = lsp_config.util.root_pattern("Gemfile", ".git"),
					flags = {
						debounce_text_changes = 150,
					},
					init_options = {
						formatting = true,
					},
				})
			end,
			keys = {
				{ "<space>,", "<cmd>Lspsaga diagnostic_jump_prev<CR>" },
				{ "<space>;", "<cmd>Lspsaga diagnostic_jump_next<CR>" },
				{ "<space>h", "<cmd>Lspsaga hover_doc<CR>" },
				{ "<space>l", "<cmd>Lspsaga show_line_diagnostics<CR>" },
				{ "<space>a", "<cmd>Lspsaga code_action<CR>" },
				{ "<space>d", "<cmd>Lspsaga peek_definition<CR>" },
				{ "<space>o", "<cmd>Lspsaga outline<CR>" },
				{ "<space>m", "<cmd>Lspsaga rename<CR>" },
			},
		},
	},

	{
		"someone-stole-my-name/yaml-companion.nvim",
		config = true,
		dependencies = {
			"neovim/nvim-lspconfig",
			"nvim-lua/plenary.nvim",
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
				-- "yamllint",
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
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{ "†", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Diagnostics (Trouble)" }, -- alt-t
		},
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
