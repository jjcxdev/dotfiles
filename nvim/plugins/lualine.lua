-- plugins/lualine.lua

return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()

        -- Define a custom theme with your desired colors
        local custom_horizon = require'lualine.themes.horizon'

        -- Modify the colors for the modes
        custom_horizon.normal.a.bg = '#EA33F7'   -- Purple for normal mode
        custom_horizon.insert.a.bg = '#5EC26A'   -- Green for insert mode
        custom_horizon.visual.a.bg = '#5BC5FA'   -- Cyan for visual mode
        require('lualine').setup {
            options = {
                icons_enabled = true,
                theme = custom_horizon,
                component_separators = { left = '', right = ''},
                section_separators = { left = '', right = ''},
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = false,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                }
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = {'filename'},
                lualine_x = {'encoding', 'fileformat', 'filetype'},
                lualine_y = {'progress'},
                lualine_z = {'location'}
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {'filename'},
                lualine_x = {'location'},
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        }
    end
}

