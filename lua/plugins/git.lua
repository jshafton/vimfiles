return {
  {
    "tpope/vim-fugitive",
    lazy = false,
    keys = {
      { "<leader>gs",   "<cmd>Git<CR>" },
      { "<leader>gc",   "<cmd>Git commit<CR>" },
      { "<leader>gca",  "<cmd>Git commit --amend<CR>" },
      { "<leader>gb",   "<cmd>Git blame<CR>" },
      { "<leader>gd",   "<cmd>Gdiffsplit<CR>" },
      { "<leader>gr",   "<cmd>Gread<CR>" },
      { "<leader>grm",  "<cmd>Gread $(git rev-parse --verify master || git rev-parse --verify main):%<CR>" },
      { "<leader>gw",   "<cmd>Gwrite<CR>" },
      { "<leader>gp",   "<cmd>Git push<CR>" },
      { "<leader>gpf",  "<cmd>Git push --force<CR>" },
      { "<leader>gpsu", "<cmd>! git push -u origin $(git rev-parse --abbrev-ref HEAD)<CR>" },
      { "<leader>grb",  "<cmd>! git pull --rebase<CR>" },
      { "<leader>ga",   "<cmd>! git add .<CR>" },
      { "<leader>grh",  "<cmd>! git reset .<CR>" },

      -- git 'pull request' to finish up a PR
      {
        "<leader>gpr",
        "<cmd>! git push -u origin $(git rev-parse --abbrev-ref HEAD) && hub pull-request --no-edit -o<CR>",
      },
    },
  },

  { "tpope/vim-rhubarb" },

  {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    dependencies = "nvim-lua/plenary.nvim",
    opts = {
      on_attach = function(bufnr)
        local gitsigns = require("gitsigns")

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map("n", "]c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gitsigns.nav_hunk("next")
          end
        end)

        map("n", "[c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gitsigns.nav_hunk("prev")
          end
        end)

        -- Actions
        map("n", "<leader>ghs", gitsigns.stage_hunk)
        map("n", "<leader>ghr", gitsigns.reset_hunk)

        map("v", "<leader>ghs", function()
          gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end)

        map("v", "<leader>ghr", function()
          gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end)

        map("n", "<leader>ghp", gitsigns.preview_hunk)
        map("n", "<leader>ghi", gitsigns.preview_hunk_inline)

        map("n", "<space>g", function()
          gitsigns.blame_line({ full = true })
        end)

        -- covered by fugitive
        -- map("n", "<leader>hS", gitsigns.stage_buffer)
        -- map("n", "<leader>hR", gitsigns.reset_buffer)
        -- map("n", "<leader>ghd", gitsigns.diffthis)
        -- map("n", "<leader>ghD", function()
        -- 	gitsigns.diffthis("~")
        -- end)

        map("n", "<leader>ghQ", function()
          gitsigns.setqflist("all")
        end)
        map("n", "<leader>ghq", gitsigns.setqflist)

        -- Toggles
        map("n", "<leader>tb", gitsigns.toggle_current_line_blame)
        map("n", "<leader>td", gitsigns.toggle_deleted)
        map("n", "<leader>tw", gitsigns.toggle_word_diff)

        -- Text object
        map({ "o", "x" }, "ih", gitsigns.select_hunk)
      end,
    },
  },

  {
    "ruifm/gitlinker.nvim",
    keys = {
      {
        "<leader>gy",
        '<cmd>lua require("gitlinker").get_buf_range_url("n")<CR>',
        mode = "n",
        { silent = false },
      }, -- copy github link
      {
        "<leader>gy",
        '<cmd>lua require("gitlinker").get_buf_range_url("v")<CR><ESC>',
        mode = "v",
        { silent = false },
      }, -- copy github link
    },
    dependencies = "nvim-lua/plenary.nvim",
  },

  {
    "sindrets/diffview.nvim",
    keys = {
      { "©", "<cmd>DiffviewOlen<CR>" },
    },
  },

  {
    'axkirillov/unified.nvim',
    opts = {
      -- your configuration comes here
    }
  },

  {
    "voldikss/vim-floaterm",
    keys = {
      { "<leader>gz", "<cmd>FloatermNew --name=lazygit --height=0.9 --width=0.9 lazygit<CR>" },
    },
    config = function()
      -- Don't exit insert mode with escape key in lazygit
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "floaterm",
        callback = function()
          if vim.b.floaterm_name == "lazygit" then
            vim.keymap.set('t', '<Esc>', '<Esc>', { buffer = true })
          end
        end
      })
    end
  },

}
