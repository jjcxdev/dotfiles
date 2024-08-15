-- COMMENT Plugin Keybindings
-- These are just examples, modify as needed
vim.keymap.set('n', '<leader>/', function()
  require('Comment.api').toggle.linewise.current()
end, { desc = 'Toggle comment on current line' })

vim.keymap.set('v', '<leader>/', function()
  require('Comment.api').toggle.linewise(vim.fn.visualmode())
end, { desc = 'Toggle comment on selected lines' })

