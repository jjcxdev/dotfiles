-- plugins/telescope.lua

return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('telescope').setup({
            -- Your Telescope configuration here
        })

        -- Load the Harpoon extension for Telescope
        require('telescope').load_extension('harpoon')
    end,
}

