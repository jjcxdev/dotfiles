-- plugins/harpoon.lua

return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,  -- Ensure that Harpoon is loaded immediately
    config = function()
        require("harpoon").setup({})
    end,
}

