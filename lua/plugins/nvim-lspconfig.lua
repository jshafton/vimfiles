local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

map('n', '<space>,', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', default_opts)
map('n', '<space>;', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', default_opts)
map('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', default_opts)
map('n', '<space>d', '<cmd>lua vim.lsp.buf.definition()<CR>', default_opts)
map('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', default_opts)
map('n', '<space>h', '<cmd>lua vim.lsp.buf.hover()<CR>', default_opts)
map('n', '<space>m', '<cmd>lua vim.lsp.buf.rename()<CR>', default_opts)
map('n', '<space>r', '<cmd>lua vim.lsp.buf.references()<CR>', default_opts)
map('n', '<space>s', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', default_opts)

require('lspconfig').bashls.setup{}
