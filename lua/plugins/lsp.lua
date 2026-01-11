return {
  {
    {
      "neovim/nvim-lspconfig",
      event = { "BufReadPre", "BufNewFile" },
      dependencies = {
        "mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "saghen/blink.cmp",
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
      },
      config = function(_, _)
        local lsp_config = require("lspconfig")

        vim.lsp.config["yamlls"] = {
          settings = {
            yaml = {
              schemas = {
                ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.22.1-standalone/all.json"] =
                "*k8s**/*",
                ["https://raw.githubusercontent.com/ansible/schemas/main/f/ansible.json"] = "*ansible**/*",
                ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
                ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
                ["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
                ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
                ["http://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
                ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
                ["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
                ["https://json.schemastore.org/gitlab-ci"] = "*gitlab-ci*.{yml,yaml}",
                ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] =
                "*api*.{yml,yaml}",
                ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] =
                "*docker-compose*.{yml,yaml}",
                ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] =
                "*flow*.{yml,yaml}",
              },
            },
          },
        }

        vim.lsp.config["lua_ls"] = {
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
        }

        vim.lsp.config["helm_ls"] = {
          yamlls = {
            path = "yaml-language-server",
          },
        }

        vim.lsp.config["ruby-lsp"] = {
          -- Set ruby_lsp to use asdf shim if present for project-local binaries
          cmd = function()
            local ruby_lsp_cmd = os.getenv("HOME") .. "/.asdf/shims/ruby-lsp"
            if not vim.fn.filereadable(ruby_lsp_cmd) then
              ruby_lsp_cmd = "ruby-lsp"
            end
            return { ruby_lsp_cmd, "stdio" }
          end,

          -- Ensure ruby-lsp's project root is set appropriately
          root_dir = lsp_config.util.root_pattern("Gemfile", ".git"),

          flags = {
            debounce_text_changes = 150,
          },
          init_options = {
            formatting = true,
          },
        }

        vim.lsp.config["ts_ls"] = {
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = 'all',
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
              }
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = 'all',
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
              }
            }
          }
        }

        require("mason").setup()
        require("mason-lspconfig").setup({
          ensure_installed = {
            "bashls",
            "lua_ls",
            "dockerls",
            "helm_ls",
            "jedi_language_server",
            "jsonls",
            "pylsp",
            "ruby_lsp",
            "terraformls",
            "yamlls",
            "ts_ls",
            "prismals",
            "eslint",
          },
        })
      end,

      keys = {
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
    "mosheavni/yaml-companion.nvim",
    config = true,
  },

  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    opts = {
      -- registries = {
      --   "github:mason-org/mason-registry",
      --   "github:Crashdummyy/mason-registry",
      -- },
      ensure_installed = {
        "actionlint",
        "coffeesense-language-server",
        "flake8",
        "gitlint",
        "gitui",
        "hclfmt",
        "jsonlint",
        "shellcheck",
        "shfmt",
        "sqlfmt",
        "stylua",
        "tflint",
      },
    },
  },

  {
    "nvimdev/lspsaga.nvim",
    branch = "main",
    config = true,
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    }
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
