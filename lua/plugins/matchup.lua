vim.g.matchup_matchparen_offscreen = {['method'] = 'popup'} -- or 'status'
vim.g.matchup_matchparen_enabled = 1
vim.g.matchup_motion_enabled = 1
vim.g.matchup_text_obj_enabled = 1
vim.g.matchup_surround_enabled = 1
vim.g.matchup_transmute_enabled = 0
vim.g.matchup_delim_stopline = 1500
vim.g.matchup_matchparen_timeout = 300
vim.g.matchup_matchparen_insert_timeout = 60
vim.g.matchup_matchparen_deferred = 1
vim.g.matchup_matchparen_deferred_show_delay = 50
vim.g.matchup_matchparen_deferred_hide_delay = 700

require('nvim-treesitter.configs').setup {
  matchup = {
    enable = true,              -- mandatory, false will disable the whole extension
    -- disable = { "c", "ruby" },  -- optional, list of language that will be disabled
    -- [options]
  },
}
