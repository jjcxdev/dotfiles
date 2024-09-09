-- config/lazy.lua

-- Define the path to lazy.nvim
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

-- Dynamically load all plugin files from the plugins directory
local function load_plugins()
    local plugins = {}
    local plugin_files = vim.fn.glob(vim.fn.stdpath("config") .. "/plugins/*.lua", true, true)
    for _, file in ipairs(plugin_files) do
        local ok, plugin = pcall(dofile, file)
        if ok and plugin then
            table.insert(plugins, plugin)
        end
    end
    return plugins
end

-- Setup lazy.nvim with the loaded plugins
require('lazy').setup({
    spec = load_plugins(),
    install = { colorscheme = { "tokyonight" } },  -- Ensure the colorscheme is installed
    checker = { enabled = true },  -- Enable plugin updates checking
})
