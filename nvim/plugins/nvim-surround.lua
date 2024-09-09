return {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy", -- Load the plugin lazily
    config = function()
        -- Setup nvim-surround with custom keymaps
        require("nvim-surround").setup({
            keymaps = {
                insert = "<C-g>s",       -- Insert surround
                insert_line = "<C-g>S",  -- Surround current line
                normal = "ys",           -- Add surround to motion
                normal_cur = "yss",      -- Surround current line
                delete = "ds",           -- Delete surround
                change = "cs",           -- Change surround
            },
        })
    end,
}
