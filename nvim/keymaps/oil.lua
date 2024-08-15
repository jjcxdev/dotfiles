-- keymaps/oil.lua

-- Open Oil file manager
vim.keymap.set('n', '<leader>o', function()
  require('oil').toggle_float()
end, { desc = 'Toggle Oil File Manager' })

