M = {}

local previewers = require('telescope.previewers')
local builtin = require('telescope.builtin')

-- NOTE: there's some issue with C-d and C-u in the previewer with Delta
-- https://github.com/nvim-telescope/telescope.nvim/issues/605

local delta_all = previewers.new_termopen_previewer {
  get_command = function(entry)
    return { 'git', '-c', 'core.pager=delta', '-c', 'delta.side-by-side=false', 'diff', entry.value .. '^!' }
  end
}

local delta_buffer = previewers.new_termopen_previewer {
  get_command = function(entry)
    return { 'git', '-c', 'core.pager=delta', '-c', 'delta.side-by-side=false', '-c', 'delta.paging=never', 'diff', entry.value .. '^!', '--', entry.current_file }
  end
}

M.git_commits = function(opts)
  opts = opts or {}
  opts.previewer = {
    delta_all,
    previewers.git_commit_message.new(opts),
    previewers.git_commit_diff_as_was.new(opts),
  }

  builtin.git_bcommits(opts)
end

M.git_bcommits = function(opts)
  opts = opts or {}
  opts.previewer = {
    delta_buffer,
    previewers.git_commit_message.new(opts),
    previewers.git_commit_diff_as_was.new(opts),
  }

  builtin.git_bcommits(opts)
end

return M
