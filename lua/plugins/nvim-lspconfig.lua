local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require('lspconfig').sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
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

require('lspconfig').tsserver.setup{}
require('lspconfig').bashls.setup{}
-- TODO: only do this for non-ansible files
require('lspconfig').yamlls.setup{}
require('lspconfig').dockerls.setup{}
-- TODO: can this work for ansible 1.9.6?
-- require('lspconfig').ansiblels.setup{}
require'lspconfig'.solargraph.setup {
  flags = {
    debounce_text_changes = 150,
  }
}
