return {
  {
    "EdenEast/nightfox.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    opts = {
      options = {
        transparent = true,
        dim_inactive = true,
        styles = {
          functions = "bold",
        },
      },
    },
  },
  {
    "rebelot/kanagawa.nvim",
    opts = {
      theme = "wave",
      background = {
        dark = "wave",
        light = "lotus",
      },
    },
  },
  {
    "marko-cerovac/material.nvim",
  },
  {
    "ribru17/bamboo.nvim",
  },
  {
    "ThorstenRhau/token",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    init = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme token]])
      -- vim.api.nvim_set_hl(0, "@property.yaml", { fg = "#527594" })
    end,
  },
}
