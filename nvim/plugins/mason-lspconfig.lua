return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim",  -- Ensure mason.nvim is loaded first
        "neovim/nvim-lspconfig",    -- Ensure nvim-lspconfig is available
        "jose-elias-alvarez/null-ls.nvim",
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
            if server_name == "lua_ls" then
                lspconfig.lua_ls.setup({
                    capabilities = capabilities,
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { 'vim' },  -- Recognize 'vim' as a global variable
                            },
                            workspace = {
                                library = {
                                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,  -- Make Neovim runtime files visible
                                    [vim.fn.stdpath('config') .. '/lua'] = true, -- Your Neovim config files
                                },
                            },
                        },
                    },
                })
            else
                lspconfig[server_name].setup({
                    capabilities = capabilities,
                })
            end
        end,
    })

    -- null-ls formatting
    local null_ls = require("null-ls")

    -- create autocmd for lsp formatting
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    
    -- setup formattting
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.prettier,
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = "LspFormatting", buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("LspFormatting", {}),
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr })
            end,
          })
        end
      end,
    })
  end,
}
