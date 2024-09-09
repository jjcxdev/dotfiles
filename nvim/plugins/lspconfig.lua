return {
    "neovim/nvim-lspconfig",
    config = function()
        -- LSP Keybindings
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'LSP: [R]e[n]ame' })
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'LSP: [C]ode [A]ction' })
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'LSP: [G]oto [D]efinition' })

        -- Telescope LSP Keybindings
        vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { desc = 'LSP: [G]oto [R]eferences' })
        vim.keymap.set('n', 'gi', require('telescope.builtin').lsp_implementations, { desc = 'LSP: [G]oto [I]mplementation' })
        vim.keymap.set('n', '<leader>bs', require('telescope.builtin').lsp_document_symbols, { desc = 'LSP: [B]uffer [S]ymbols' })
        vim.keymap.set('n', '<leader>ps', require('telescope.builtin').lsp_workspace_symbols, { desc = 'LSP: [P]roject [S]ymbols' })

        -- Additional LSP Keybindings
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'LSP: Hover Documentation' })
        vim.keymap.set('n', '<leader>k', vim.lsp.buf.signature_help, { desc = 'LSP: Signature Documentation' })
        vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, { desc = 'LSP: Signature Documentation' })
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'LSP: [G]oto [D]eclaration' })
        vim.keymap.set('n', 'td', vim.lsp.buf.type_definition, { desc = 'LSP: [T]ype [D]efinition' })

        -- LSP Server Setup
        local lspconfig = require('lspconfig')

        -- Use typescript-language-server setup (this is the correct server)
        lspconfig.tsserver.setup({
            on_attach = function(client, bufnr)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })
                vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })
            end,
            capabilities = require('cmp_nvim_lsp').default_capabilities(),
        })

        -- Lua language server setup for Neovim development
        lspconfig.lua_ls.setup {
            settings = {
                Lua = {
                    runtime = {
                        version = 'LuaJIT',
                        path = vim.split(package.path, ';'),
                    },
                    diagnostics = {
                        globals = { 'vim' },  -- Recognize the `vim` global
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                            [vim.fn.stdpath('config') .. '/lua'] = true,
                        },
                        maxPreload = 10000,
                        preloadFileSize = 10000,
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            },
        }
    end,
}
