-- plugins/comment.lua

return {
    'numToStr/Comment.nvim',
    opts = {
        -- Add any additional options here if needed
    },
    config = function()
        require('Comment').setup()

        -- Comment Plugin Keybindings
        vim.keymap.set('n', '<leader>/', function()
            require('Comment.api').toggle.linewise.current()
        end, { desc = 'Toggle comment on current line' })

        vim.keymap.set('v', '<leader>/', function()
            -- This explicitly toggles comments on the selected lines without affecting the previous selection
            local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)
            vim.api.nvim_feedkeys(esc, 'nx', false) -- Exit visual mode to ensure correct toggling
            require('Comment.api').toggle.linewise(vim.fn.visualmode())
        end, { desc = 'Toggle comment on selected lines' })
    end,
}
