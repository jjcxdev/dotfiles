--- config/autocmds.lua

local cmd = vim.cmd

-- Highlight yanked text
cmd('au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=150}')

-- Automatically read file if it changes on disk
cmd('au FocusGained,BufEnter * checktime')

