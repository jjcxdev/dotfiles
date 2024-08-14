-- config/keymaps.lua
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Example key mappings
map('n', '<Leader>w', ':w<CR>', opts)
map('n', '<Leader>q', ':q<CR>', opts)
map('n', '<Leader>x', ':x<CR>', opts)

-- Load Harpoon
local harpoon = require("plugins.harpoon")

-- Basic Harpoon key mappings
vim.keymap.set("n", "<leader>a", function() harpoon.mark.add_file() end, { desc = "Harpoon Add File" })
vim.keymap.set("n", "<C-e>", function() require('telescope').extensions.harpoon.marks() end, { desc = "Harpoon Marks" })

vim.keymap.set("n", "<C-h>", function() harpoon.ui.nav_file(1) end, { desc = "Harpoon Go to File 1" })
vim.keymap.set("n", "<C-t>", function() harpoon.ui.nav_file(2) end, { desc = "Harpoon Go to File 2" })
vim.keymap.set("n", "<C-n>", function() harpoon.ui.nav_file(3) end, { desc = "Harpoon Go to File 3" })
vim.keymap.set("n", "<C-s>", function() harpoon.ui.nav_file(4) end, { desc = "Harpoon Go to File 4" })

-- Delay loading Telescope keymaps until after VimEnter
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        local telescope = require("telescope.builtin")
        vim.keymap.set('n', '<leader>ff', telescope.find_files, { desc = "Find Files" })
        vim.keymap.set('n', '<leader>fg', telescope.live_grep, { desc = "Live Grep" })
        vim.keymap.set('n', '<leader>fb', telescope.buffers, { desc = "Find Buffers" })
        vim.keymap.set('n', '<leader>fh', telescope.help_tags, { desc = "Find Help Tags" })
        vim.keymap.set('n', '<leader>fr', telescope.oldfiles, { desc = "Find Recent Files" })
        vim.keymap.set('n', '<leader>fw', telescope.grep_string, { desc = "Find Word Under Cursor" })
        vim.keymap.set('n', '<leader>fs', telescope.current_buffer_fuzzy_find, { desc = "Fuzzy Search in Buffer" })
    end,
})
