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
        -- LSP Server Settings
        servers = {
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
          },
          lua_ls = {
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
          helm_ls = {
            yamlls = {
              path = "yaml-language-server",
            },
          },
          ruby_lsp = {
            flags = {
              debounce_text_changes = 150,
            },
            init_options = {
              formatting = true,
            },
          },
        },
      },
      config = function(_, opts)
        local lsp_config = require("lspconfig")

        -- Ensure ruby-lsp's project root is set appropriately
        opts.servers.ruby_lsp.root_dir = lsp_config.util.root_pattern("Gemfile", ".git")

        -- Set ruby_lsp to use asdf shim if present for project-local binaries
        local ruby_lsp_cmd = os.getenv("HOME") .. "/.asdf/shims/ruby-lsp"
        if vim.fn.filereadable(ruby_lsp_cmd) == 1 then
          opts.servers.ruby_lsp.cmd = { ruby_lsp_cmd, "stdio" }
        end

        require("mason").setup()
        require("mason-lspconfig").setup()

        -- Ensure setup is called for every lsp server set up with Mason,
        -- and ensure it's configured for (blink) completion
        require("mason-lspconfig").setup_handlers({
          function(server_name) -- default handler
            local config = opts.servers[server_name] or {}
            config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities or {})
            lsp_config[server_name].setup(config)
          end,
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
      registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
      },
      ensure_installed = {
        "actionlint",
        "bash-language-server",
        "coffeesense-language-server",
        "deno",
        "dockerfile-language-server",
        "flake8",
        "gitlint",
        "gitui",
        "groovy-language-server",
        "hclfmt",
        "helm-ls",
        "jedi-language-server",
        "json-lsp",
        "jsonlint",
        "lua-language-server",
        "python-lsp-server",
        "ruby-lsp",
        "shellcheck",
        "shfmt",
        "sqlfmt",
        "stylua",
        "terraform-ls",
        "tflint",
        "typescript-language-server",
        "yaml-language-server",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)

      -- This is a custom implementation to ensure that all desired tools
      -- are installed at startup, similar to a feature that's built in to
      -- mason-lspconfig. It's a little better here because not everything is an
      -- lsp server
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
