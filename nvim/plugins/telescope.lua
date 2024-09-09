return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        -- Telescope setup
        require('telescope').setup({
            -- Your Telescope configuration here
        })

        -- Load the Harpoon extension for Telescope
        require('telescope').load_extension('harpoon')

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
                vim.keymap.set('n', '<leader>fp', telescope.git_files, { desc = "Find Files in Project" }) -- New keybinding for project files
            end,
        })

        -- Additional Telescope Keybindings
        vim.keymap.set('n', '<leader>sc', function()
          require('telescope.builtin').commands(require('telescope.themes').get_dropdown {
            previewer = false,
          })
        end, { desc = '[S]earch [C]ommands' })

        vim.keymap.set('n', '<leader>/', function()
          require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
            previewer = false,
          })
        end, { desc = '[/] Fuzzily search in current buffer' })

        vim.keymap.set('n', '<leader>ss', function()
          require('telescope.builtin').spell_suggest(require('telescope.themes').get_dropdown {
            previewer = false,
          })
        end, { desc = '[S]earch [S]pelling suggestions' })
    end,
}
