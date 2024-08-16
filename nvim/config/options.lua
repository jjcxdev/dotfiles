--- config/options.lua

local opt = vim.opt

-- Enable linebreak to wrap long lines at words
vim.opt.linebreak = true

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

-- turn on termguicolors for tokyonight colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift
