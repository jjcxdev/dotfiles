local M = {}

M.setup = function()

    -- Ensure no other key mappings interfere with the space key
    vim.api.nvim_set_keymap('n', '<Space>', '', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('v', '<Space>', '', { noremap = true, silent = true })

    -- Map j and k to move by screen lines when wrapping is enabled
    vim.api.nvim_set_keymap('n', 'j', 'v:count == 0 ? "gj" : "j"', { noremap = true, expr = true, silent = true })
    vim.api.nvim_set_keymap('n', 'k', 'v:count == 0 ? "gk" : "k"', { noremap = true, expr = true, silent = true })
    vim.api.nvim_set_keymap('v', 'j', 'v:count == 0 ? "gj" : "j"', { noremap = true, expr = true, silent = true })
    vim.api.nvim_set_keymap('v', 'k', 'v:count == 0 ? "gk" : "k"', { noremap = true, expr = true, silent = true })

    -- Map arrow keys to move by screen lines when wrapping is enabled
    vim.api.nvim_set_keymap('n', '<Up>', 'v:count == 0 ? "gk" : "k"', { noremap = true, expr = true, silent = true })
    vim.api.nvim_set_keymap('n', '<Down>', 'v:count == 0 ? "gj" : "j"', { noremap = true, expr = true, silent = true })
    vim.api.nvim_set_keymap('v', '<Up>', 'v:count == 0 ? "gk" : "k"', { noremap = true, expr = true, silent = true })
    vim.api.nvim_set_keymap('v', '<Down>', 'v:count == 0 ? "gj" : "j"', { noremap = true, expr = true, silent = true })
    vim.api.nvim_set_keymap('i', '<Up>', '<C-o>gk', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('i', '<Down>', '<C-o>gj', { noremap = true, silent = true })

    -- Buffer Navigation
    vim.keymap.set("n", "<leader>'", '<C-^>', { desc = 'Switch to last buffer' })

    -- Insert mode keymaps
    vim.keymap.set('i', 'jj', '<esc>', { desc = 'Exit insert mode' })

    -- Visual mode keymaps
    vim.keymap.set('v', 'L', '$<left>', { desc = 'Jump to end of line' })
    vim.keymap.set('v', 'H', '^', { desc = 'Jump to start of line' })
    vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selected text down' })
    vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = 'Move selected text up' })

    -- Reselect the last visual selection
    vim.keymap.set('x', '<<', function()
        vim.cmd 'normal! <<'
        vim.cmd 'normal! gv'
    end, { desc = 'Reselect and indent left' })

    vim.keymap.set('x', '>>', function()
        vim.cmd 'normal! >>'
        vim.cmd 'normal! gv'
    end, { desc = 'Reselect and indent right' })

    -- Reselect after pasting in visual mode
    vim.keymap.set('x', '<leader>p', '"_dP', { desc = 'Paste without replacing clipboard' })
end

return {
    config = function()
        M.setup()
    end,
}
