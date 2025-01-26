return {
  "mbbill/undotree",
  keys = {
    { "<leader>ut", "<cmd>UndotreeToggle<cr>" },
  },
  config = function()
    vim.g.undotree_WindowLayout = 2
    vim.g.undotree_ShortIndicators = 1
    vim.g.undotree_SplitWidth = vim.g.undotree_ShortIndicators == 1 and 30 or 40
    vim.g.undotree_DiffpanelHeight = 12
    vim.g.undotree_SetFocusWhenToggle = 1
    vim.g.undotree_DiffAutoOpen = 0

    if vim.fn.has("persistent_undo") == 1 then
      local target_path = vim.fn.expand("~/.undodir")
      if vim.fn.isdirectory(target_path) == 0 then
        vim.fn.mkdir(target_path, "p", 0755)
      end
      vim.opt.undodir = target_path
      vim.opt.undofile = true
    end
  end,
}
