-- LSP Keybindings
local M = {}

M.map_lsp_keybinds = function(buffer_number)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'LSP: [R]e[n]ame', buffer = buffer_number })
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'LSP: [C]ode [A]ction', buffer = buffer_number })
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'LSP: [G]oto [D]efinition', buffer = buffer_number })

  -- Telescope LSP Keybindings
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { desc = 'LSP: [G]oto [R]eferences', buffer = buffer_number })
  vim.keymap.set('n', 'gi', require('telescope.builtin').lsp_implementations, { desc = 'LSP: [G]oto [I]mplementation', buffer = buffer_number })
  vim.keymap.set('n', '<leader>bs', require('telescope.builtin').lsp_document_symbols, { desc = 'LSP: [B]uffer [S]ymbols', buffer = buffer_number })
  vim.keymap.set('n', '<leader>ps', require('telescope.builtin').lsp_workspace_symbols, { desc = 'LSP: [P]roject [S]ymbols', buffer = buffer_number })
end

-- Additional LSP Keybindings
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'LSP: Hover Documentation' })
vim.keymap.set('n', '<leader>k', vim.lsp.buf.signature_help, { desc = 'LSP: Signature Documentation' })
vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, { desc = 'LSP: Signature Documentation' })
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'LSP: [G]oto [D]eclaration' })
vim.keymap.set('n', 'td', vim.lsp.buf.type_definition, { desc = 'LSP: [T]ype [D]efinition' })

return M
