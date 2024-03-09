return {
  {
    'xiyaowong/transparent.nvim',
    config = function()
      require('transparent').setup {
        extra_groups = {
          'WhichKey',
          'WhichKeyFloat',
        },
      }
      -- Here you can add clear_prefix calls if necessary
      require('transparent').clear_prefix 'which-key'
    end,
  },
}
