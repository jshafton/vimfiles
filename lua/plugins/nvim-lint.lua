return {
  'mfussenegger/nvim-lint',
  event = { "BufWritePost" },
  config = function ()
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })

    require('lint').linters_by_ft = {
      json = {'jsonlint',}
    }
  end
}
