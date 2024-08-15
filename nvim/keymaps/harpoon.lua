-- HARPOON Keybindings
local harpoon_ui = require("harpoon.ui")

-- Basic Harpoon Key Mappings
vim.keymap.set("n", "<leader>a", function() harpoon_mark.add_file() end, { desc = "Harpoon Add File" })

-- Harpoon UI
vim.keymap.set("n", "<leader>ho", function() harpoon_ui.toggle_quick_menu() end, { desc = "Harpoon Open UI" })
vim.keymap.set("n", "<leader>hr", function() harpoon_mark.rm_file() end, { desc = "Harpoon Remove File" })
vim.keymap.set("n", "<leader>hc", function() harpoon_mark.clear_all() end, { desc = "Harpoon Clear All" })

-- Harpoon File Navigation
vim.keymap.set("n", "<leader>1", function() harpoon_ui.nav_file(1) end, { desc = "Harpoon Go to File 1 (Leader)" })
vim.keymap.set("n", "<leader>2", function() harpoon_ui.nav_file(2) end, { desc = "Harpoon Go to File 2 (Leader)" })
vim.keymap.set("n", "<leader>3", function() harpoon_ui.nav_file(3) end, { desc = "Harpoon Go to File 3 (Leader)" })
vim.keymap.set("n", "<leader>4", function() harpoon_ui.nav_file(4) end, { desc = "Harpoon Go to File 4 (Leader)" })
vim.keymap.set("n", "<leader>5", function() harpoon_ui.nav_file(5) end, { desc = "Harpoon Go to File 5 (Leader)" })
