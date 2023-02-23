local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local capabilities = require('cmp_nvim_lsp')
  .default_capabilities(vim.lsp.protocol.make_client_capabilities())

require("mason").setup()
require("mason-lspconfig").setup()

require('lspconfig').lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      completion = {
        callSnippet = 'Replace',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim','use'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        ignoreDir = {
          '.undo',
          '.git'
        },
        useGitIgnore = true
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

require('lspconfig').tsserver.setup{
  capabilities = capabilities,
  settings = {
    completions = {
      completeFunctionCalls = true,
    },
  },
}

require('lspconfig').bashls.setup{
  capabilities = capabilities
}

require('lspconfig').yamlls.setup{
  capabilities = capabilities,
  settings = {
    yaml = {
      schemas = {
        ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.22.1-standalone/all.json"] = "k8s**/*",
        ["https://raw.githubusercontent.com/ansible/schemas/main/f/ansible.json"] = "*ansible**/*"
      },
    }
  },
  on_attach = function(_, bufnr)
    if vim.bo[bufnr].buftype ~= "" or vim.bo[bufnr].filetype == "helm" then
      vim.diagnostic.disable()
    end
  end
}

require('lspconfig').dockerls.setup{
  capabilities = capabilities
}
-- TODO: can this work for ansible 1.9.6?
-- require('lspconfig').ansiblels.setup{}
require('lspconfig').solargraph.setup {
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
  init_options = {
    formatting = true
  }
}

require('lspconfig').jedi_language_server.setup{
  capabilities = capabilities
}
-- require('lspconfig').denols.setup {
--   capabilities = capabilities,
--   init_options = {
--     enable = true,
--     lint = true,
--     unstable = false
--   }
-- }

require('lspconfig').jsonls.setup{
  capabilities = capabilities
}
