-- plugins/codesnap.lua

return {
    "mistricky/codesnap.nvim",
    build = "make",
    config = function()
        -- CodeSnap Plugin Keybinding
        vim.keymap.set("v", "<leader>cs", ":lua require('codesnap').capture('png')<CR>", { noremap = true, silent = true, desc = "Capture code snippet as PNG" })
    end,
}
