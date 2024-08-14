-- plugins/noice.lua
return {
    "folke/noice.nvim",
    config = function()
        require("noice").setup()
    end,
}

