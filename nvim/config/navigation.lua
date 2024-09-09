
-- plugins/navigation.lua

return {
  {
    -- Kitty Navigation Plugin (Optional)
    -- Make sure to include the actual plugin setup here if you're using a plugin like `ctrlpvim/ctrlp.vim` for Kitty.
    -- Example: 'knubie/vim-kitty-navigator',
    -- Example: 'christoomey/vim-tmux-navigator',
  },
  config = function()
    -- Window Navigation + Better Kitty and Tmux Navigation
    vim.keymap.set('n', '<C-j>', function()
      if vim.fn.exists(':KittyNavigateDown') ~= 0 and os.getenv('TERM') == 'xterm-kitty' then
        vim.cmd.KittyNavigateDown()
      elseif vim.fn.exists(':NvimTmuxNavigateDown') ~= 0 then
        vim.cmd.NvimTmuxNavigateDown()
      else
        vim.cmd.wincmd('j')
      end
    end, { desc = 'Navigate down' })

    vim.keymap.set('n', '<C-k>', function()
      if vim.fn.exists(':KittyNavigateUp') ~= 0 and os.getenv('TERM') == 'xterm-kitty' then
        vim.cmd.KittyNavigateUp()
      elseif vim.fn.exists(':NvimTmuxNavigateUp') ~= 0 then
        vim.cmd.NvimTmuxNavigateUp()
      else
        vim.cmd.wincmd('k')
      end
    end, { desc = 'Navigate up' })

    vim.keymap.set('n', '<C-l>', function()
      if vim.fn.exists(':KittyNavigateRight') ~= 0 and os.getenv('TERM') == 'xterm-kitty' then
        vim.cmd.KittyNavigateRight()
      elseif vim.fn.exists(':NvimTmuxNavigateRight') ~= 0 then
        vim.cmd.NvimTmuxNavigateRight()
      else
        vim.cmd.wincmd('l')
      end
    end, { desc = 'Navigate right' })

    vim.keymap.set('n', '<C-h>', function()
      if vim.fn.exists(':KittyNavigateLeft') ~= 0 and os.getenv('TERM') == 'xterm-kitty' then
        vim.cmd.KittyNavigateLeft()
      elseif vim.fn.exists(':NvimTmuxNavigateLeft') ~= 0 then
        vim.cmd.NvimTmuxNavigateLeft()
      else
        vim.cmd.wincmd('h')
      end
    end, { desc = 'Navigate left' })
  end,
}
