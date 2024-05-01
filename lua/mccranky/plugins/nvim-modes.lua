return {
  {
    -- Table Mode
    "dhruvasagar/vim-table-mode",
    config = function()
      -- Markdown-compatible tables
      vim.g.table_mode_corner = "|"

      -- ReST-compatible tables
      -- vim.b.table_mode_corner = "+"
      -- vim.b.table_mode_corner_corner = "+"
      -- vim.b.table_mode_header_fillchar = "="
    end,
  },
  {
    -- Diff Mode
    "chrisbra/vim-diff-enhanced",
    config = function()
      vim.keymap.set("n", "<leader>ede", "<cmd>PatienceDiff<CR>", { desc = "Generate new Patience Diff" })
      vim.keymap.set("n", "<leader>edd", "<cmd>EnhancedDiffDisable<CR>", { desc = "Disable EnhancedDiff" })
    end,

    -- Regular vimdiff
    -- :vsplit [...] | windo diffthis
    -- :vert diffsplit [...]
  },
}
