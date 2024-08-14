-- plugins/notify.lua

return {
    "rcarriga/nvim-notify",
    config = function()
        -- Set nvim-notify as the default notification function
        vim.notify = require("notify")

        -- Optionally configure nvim-notify
        require("notify").setup({
            stages = "fade_in_slide_out",
            timeout = 3000,
            background_colour = "#000000",
        })

        -- Load the Telescope extension
        require('telescope').load_extension('notify')
    end,
}

