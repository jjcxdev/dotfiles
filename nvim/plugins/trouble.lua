return {
  "folke/trouble.nvim",
  opts = {
    auto_close = true,  -- Close the Trouble window automatically when all items are resolved
    auto_open = true,   -- Open the Trouble window automatically when there are diagnostics
    use_diagnostic_signs = true  -- Use the same signs defined in the LSP config
  },
  cmd = { "Trouble", "TroubleClose", "TroubleRefresh" },  -- Lazy-load the plugin when these commands are used
  keys = {
    -- Update keybindings to use the correct Trouble commands
    {
      "<leader>tx",
      "<cmd>Trouble diagnostics<cr>",
      desc = "Toggle Trouble diagnostics",
      silent = true,
      noremap = true
    },
    {
      "<leader>tw",
      "<cmd>Trouble workspace_diagnostics<cr>",
      desc = "Show workspace diagnostics",
      silent = true,
      noremap = true
    },
    {
      "<leader>td",
      "<cmd>Trouble document_diagnostics<cr>",
      desc = "Show document diagnostics",
      silent = true,
      noremap = true
    },
    {
      "<leader>tl",
      "<cmd>Trouble loclist<cr>",
      desc = "Toggle location list",
      silent = true,
      noremap = true
    },
    {
      "<leader>tq",
      "<cmd>Trouble quickfix<cr>",
      desc = "Toggle quickfix list",
      silent = true,
      noremap = true
    },
    {
      "gR",
      "<cmd>Trouble lsp_references<cr>",
      desc = "Show LSP references",
      silent = true,
      noremap = true
    },
  }
}
