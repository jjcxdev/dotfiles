
-- plugins/diagnostics.lua

local M = {}

M.setup = function()
    -- Diagnostics navigation and management keybindings
    vim.keymap.set('n', ']d', function()
        vim.diagnostic.goto_next({})
        vim.api.nvim_feedkeys('zz', 'n', false)
    end, { desc = 'Go to next diagnostic' })

    vim.keymap.set('n', '[d', function()
        vim.diagnostic.goto_prev({})
        vim.api.nvim_feedkeys('zz', 'n', false)
    end, { desc = 'Go to previous diagnostic' })

    vim.keymap.set('n', ']e', function()
        vim.diagnostic.goto_next { severity = vim.diagnostic.severity.ERROR }
        vim.api.nvim_feedkeys('zz', 'n', false)
    end, { desc = 'Go to next error' })

    vim.keymap.set('n', '[e', function()
        vim.diagnostic.goto_prev { severity = vim.diagnostic.severity.ERROR }
        vim.api.nvim_feedkeys('zz', 'n', false)
    end, { desc = 'Go to previous error' })

    vim.keymap.set('n', ']w', function()
        vim.diagnostic.goto_next { severity = vim.diagnostic.severity.WARN }
        vim.api.nvim_feedkeys('zz', 'n', false)
    end, { desc = 'Go to next warning' })

    vim.keymap.set('n', '[w', function()
        vim.diagnostic.goto_prev { severity = vim.diagnostic.severity.WARN }
        vim.api.nvim_feedkeys('zz', 'n', false)
    end, { desc = 'Go to previous warning' })

    vim.keymap.set('n', '<leader>d', function()
        vim.diagnostic.open_float { border = 'rounded' }
    end, { desc = 'Open diagnostic float' })

    vim.keymap.set('n', '<leader>ld', vim.diagnostic.setqflist, { desc = 'Quickfix [L]ist [D]iagnostics' })
end

return {
    config = function()
        M.setup()
    end,
}
