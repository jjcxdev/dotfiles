-- init.lua

-- Prepent the correct paths to package.path
local config_path = vim.fn.stdpath('config') .. '/?.lua;' .. vim.fn.stdpath('config') .. '/?/init.lua;'
package.path = config_path .. package.path

-- Load configuration files 
require('config.options')
require('config.autocmds')
require('config.lazy')

-- Load Keymaps
require('keymaps.harpoon')
require('keymaps.telescope')
require('keymaps.lsp')
require('keymaps.trouble')
require('keymaps.git')
require('keymaps.comment')
require('keymaps.surround')
require('keymaps.autopairs')
require('keymaps.todo-comments')
require('keymaps.codesnap')
require('keymaps.diagnostics')
require('keymaps.oil')
require('keymaps.general')
require('keymaps.navigation')
