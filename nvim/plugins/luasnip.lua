
return {
  -- Snippet engine
  'L3MON4D3/LuaSnip',
  config = function()
    require('luasnip.loaders.from_lua').load({ paths = "~/.config/nvim/snippets/" })
  end,

  -- Snippet Collection
  {
    'rafamadriz/friendly-snippets',
    event = "InsertEnter",
  },

  -- Autocompletion engine with LuaSnip support
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'saadparwaiz1/cmp_luasnip',  -- Snippet completion
    },
  },
}


