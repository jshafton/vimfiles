return {
  "mfussenegger/nvim-lint",
  dependencies = {
    "williamboman/mason.nvim",
  },
  event = { "BufWritePost", "TextChanged", "TextChangedI" }, -- Added real-time events
  config = function()
    require("lint").linters_by_ft = {
      json = { "jsonlint" },
      ghaworkflow = { "actionlint" },
      yaml = { "yamllint" },
      helm = { "yamllint" },
      sh = { "shellcheck" },
      bash = { "shellcheck" },
      terraform = { "tflint" },
      sql = { "sqlfluff" },
    }

    -- Configure SQLFluff linter
    require("lint").linters.sqlfluff = {
      cmd = "sqlfluff",
      stdin = false, -- Changed to false to use file path
      args = function(filepath)
        return {
          "lint",
          "--format=json",
          "--dialect=postgres",
          "--disable-progress-bar",
          filepath -- Pass the actual file path
        }
      end,
      stream = "stdout",
      ignore_exitcode = true,
      timeout = 10000,
    }

    vim.api.nvim_create_autocmd({ "BufWritePost", "TextChanged", "TextChangedI" }, {
      pattern = { "*.sql" }, -- Added SQL pattern
      callback = function()
        if not vim.g.disable_lint then
          require("lint").try_lint()
        end
      end,
    })

    -- Keep your original autocmd for other filetypes
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      pattern = { "*.json", "*.yaml", "*.yml", "*.sh", "*.bash", "*.tf" },
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
