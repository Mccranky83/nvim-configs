return {
  "neanias/everforest-nvim",
  priority = 1000,

  config = function()
    local transparent = false
    -- load the colorscheme here
    vim.cmd([[colorscheme everforest]])
  end,
}
