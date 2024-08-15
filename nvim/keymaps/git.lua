-- GIT Keybindings
vim.keymap.set('n', '<leader>gb', ':Gitsigns toggle_current_line_blame<cr>')
vim.keymap.set('n', '<leader>gf', function()
  local cmd = {
    'sort',
    '-u',
    '<(git diff --name-only --cached)',
    '<(git diff --name-only)',
    '<(git diff --name-only --diff-filter=U)',
  }

  if not utils.is_git_directory() then
    vim.notify('Current project is not a git directory', vim.log.levels.WARN, { title = 'Telescope Git Files', git_command = cmd })
  else
    require('telescope.builtin').git_files()
  end
end, { desc = 'Search [G]it [F]iles' })
