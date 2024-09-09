-- init.lua

local opt = vim.opt

-- General settings
opt.number = true                   -- Show line numbers
opt.relativenumber = true           -- Show relative line numbers
opt.breakindent = true              -- Enable break indent
opt.linebreak = true                -- Wrap long lines at word boundaries

-- Enable mouse support
opt.mouse = 'a'

-- Set clipboard to use system clipboard
opt.clipboard = 'unnamedplus'

-- Enable true color support
opt.termguicolors = true

-- Set Neovim background to be transparent
vim.cmd [[
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NonText guibg=NONE ctermbg=NONE
  highlight LineNr guibg=NONE ctermbg=NONE
  highlight Folded guibg=NONE ctermbg=NONE
  highlight EndOfBuffer guibg=NONE ctermbg=NONE
]]

-- Remove tilde from end of buffer
opt.fillchars = {eob = " "}

-- Set window title options
opt.title = true
opt.titlestring = "%f"

-- Set leader key to space early in the config
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Indentation settings
opt.autoindent = true
opt.smartindent = true
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2

-- Cursor settings
opt.virtualedit = ""
opt.startofline = true

-- Search settings
opt.hlsearch = true
opt.ignorecase = true

-- Scrolling settings
opt.scrolloff = 10

-- Wrapping settings
opt.wrap = false
opt.cursorline = true

-- Backspace settings
opt.backspace = {"start", "eol", "indent"}

-- Path settings
opt.path:append({"**"})
opt.wildignore:append({"*/node_modules"})

-- Sign column settings
opt.signcolumn = "yes" -- Show sign column so that text doesn't shift

-- Prepend the correct paths to package.path
local config_path = vim.fn.stdpath('config') .. '/?.lua;' .. vim.fn.stdpath('config') .. '/?/init.lua;'
package.path = config_path .. package.path

-- Load additional configuration files (if any)
require('config.autocmds')
require('config.general')
require('config.lazy')

