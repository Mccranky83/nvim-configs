return {
  "mbbill/undotree",
  keys = {
    { "<leader>ut", "<cmd>UndotreeToggle<cr>" },
    { "<leader>uu", "<cmd>UndotreeFocus<cr>" },
  },
  config = function()
    vim.g.undotree_WindowLayout = 2
    vim.g.undotree_ShortIndicators = 1
    vim.g.undotree_SplitWidth = vim.g.undotree_ShortIndicators == 1 and 30 or 40
    vim.g.undotree_DiffpanelHeight = 12
    vim.g.undotree_SetFocusWhenToggle = 1
    vim.g.undotree_DiffAutoOpen = 0
  end,
}
