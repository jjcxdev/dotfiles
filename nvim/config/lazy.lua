-- config/lazy.lua

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",  -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Dynamically require all plugin files in the plugins directory
local function load_plugins()
    local plugins = {}
    local plugin_files = vim.fn.glob(vim.fn.stdpath("config") .. "/plugins/*.lua", true, true)
    for _, file in ipairs(plugin_files) do
        local plugin = dofile(file)
        table.insert(plugins, plugin)
    end
    return plugins
end

require('lazy').setup({
    spec = load_plugins(),
    install = { colorscheme = { "habamax" } },
    checker = { enabled = true },
})

