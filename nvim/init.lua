-- init.lua

-- Prepent the correct paths to package.path
local config_path = vim.fn.stdpath('config') .. '/?.lua;' .. vim.fn.stdpath('config') .. '/?/init.lua;'
package.path = config_path .. package.path

-- Load configuration files 
require('config.keymaps')
require('config.options')
require('config.autocmds')
require('config.lazy')
