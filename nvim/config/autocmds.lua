local cmd = vim.cmd

-- Highlight yanked text
cmd('au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=150}')

-- Automatically read file if it changes on disk
cmd('au FocusGained,BufEnter * checktime')

-- Auto-format on save with Prettier
cmd([[ 
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePre *.js, *.ts, *.jsx, *.tsx, *.css, *.scss, *.html, *.json, *.md lua vim.lsp.buf.format({ async = true })
  augroup END
]])

