return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",  -- Specify the branch if needed
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        -- Ensure Harpoon is fully loaded before using it
        local harpoon = require("harpoon")
        harpoon.setup({})

        -- Basic Harpoon Key Mappings
        vim.keymap.set("n", "<leader>a", function() harpoon.mark.add_file() end, { desc = "Harpoon Add File" })

        -- Harpoon UI
        vim.keymap.set("n", "<leader>ho", function() harpoon.ui.toggle_quick_menu() end, { desc = "Harpoon Open UI" })
        vim.keymap.set("n", "<leader>hr", function() harpoon.mark.rm_file() end, { desc = "Harpoon Remove File" })
        vim.keymap.set("n", "<leader>hc", function() harpoon.mark.clear_all() end, { desc = "Harpoon Clear All" })

        -- Harpoon File Navigation
        vim.keymap.set("n", "<leader>1", function() harpoon.ui.nav_file(1) end, { desc = "Harpoon Go to File 1 (Leader)" })
        vim.keymap.set("n", "<leader>2", function() harpoon.ui.nav_file(2) end, { desc = "Harpoon Go to File 2 (Leader)" })
        vim.keymap.set("n", "<leader>3", function() harpoon.ui.nav_file(3) end, { desc = "Harpoon Go to File 3 (Leader)" })
        vim.keymap.set("n", "<leader>4", function() harpoon.ui.nav_file(4) end, { desc = "Harpoon Go to File 4 (Leader)" })
        vim.keymap.set("n", "<leader>5", function() harpoon.ui.nav_file(5) end, { desc = "Harpoon Go to File 5 (Leader)" })
    end,
}
