-- plugins/nvim-autopairs.lua

return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true,  -- Make sure this line ends with a comma
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({})
}

