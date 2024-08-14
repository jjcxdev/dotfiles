--- config/options.lua

local opt = vim.opt

-- General settings
opt.number = true
opt.relativenumber = true
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true

-- Enable mouse support
opt.mouse = 'a'

-- Set clipboard to use system clipboard
opt.clipboard = 'unnamedplus'

-- Enable true color support
vim.opt.termguicolors = true

-- Set Neovim background to be transparent
vim.cmd [[
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NonText guibg=NONE ctermbg=NONE
  highlight LineNr guibg=NONE ctermbg=NONE
  highlight Folded guibg=NONE ctermbg=NONE
  highlight EndOfBuffer guibg=NONE ctermbg=NONE
]]

-- Remove tilde from end of buffer
vim.opt.fillchars = {eob = " "}
