return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- Alternatively, you could use nvim-web-devicons
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- uncomment if you prefer nvim-web-devicons
  config = function()
    require('oil').setup({
      view_options = {
      show_hidden = true,
      },
    })

    -- Keybinding for toggling the Oil file manager
    vim.keymap.set('n', '<leader>o', function()
      require('oil').toggle_float()
    end, { desc = 'Toggle Oil File Manager' })
  end,
}
