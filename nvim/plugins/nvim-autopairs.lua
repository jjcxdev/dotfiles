-- plugins/nvim-autopairs.lua

return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",  -- Load the plugin when entering insert mode
    config = function()
        -- This is equivalent to setup({})
        require('nvim-autopairs').setup({
            -- Add any specific setup options here if needed
        })

        -- If you need custom keybindings or integrations, you can add them here.
        -- For example, if integrating with nvim-cmp:
        -- local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        -- local cmp = require('cmp')
        -- cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

        -- If you need specific keybindings, add them here.
    end,
}
