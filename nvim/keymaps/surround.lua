-- SURROUND Plugin Keybindings
-- Add specific keybindings for nvim-surround if needed
-- For instance, if you need to set up custom surrounds:
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

