return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim",  -- Ensure mason.nvim is loaded first
        "neovim/nvim-lspconfig",    -- Ensure nvim-lspconfig is available
    },
    config = function()
        -- Initialize mason.nvim
        require("mason").setup()

        -- Now initialize mason-lspconfig
        require("mason-lspconfig").setup({
            automatic_installation = true,
        })

        local lspconfig = require('lspconfig')
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        -- Automatically setup any servers installed via Mason
        require("mason-lspconfig").setup_handlers({
            function(server_name)
                if lspconfig[server_name] then
                    lspconfig[server_name].setup({
                        capabilities = capabilities,
                    })
                else
                    print("Warning: LSP server " .. server_name .. " not found.")
                end
            end,
        })
    end,
}
