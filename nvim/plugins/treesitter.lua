-- plugins/treesitter.lua

return {
    {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",  -- Automatically update treesitter parsers
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "javascript",
                    "typescript",
                    "tsx",          -- For JSX/TSX support
                    "html",
                    "css",
                    "json",
                    "bash",         -- Useful for shell scripts
                    "lua",          -- For Neovim configuration
                    "markdown",     -- For Markdown support
                    "markdown_inline",  -- For inline Markdown (e.g., code blocks)
                },
                highlight = {
                    enable = true, -- false will disable the whole extension
                },
                indent = {
                    enable = true, -- Enable treesitter-based indentation
                },
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",  -- Load after the core treesitter plugin
    },
}

