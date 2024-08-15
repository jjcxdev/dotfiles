-- keymaps/general.lua

-- Set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable space as a key to prevent unintended behavior
vim.keymap.set('n', '<space>', '<nop>', { silent = true })
vim.keymap.set('v', '<space>', '<nop>', { silent = true })

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
