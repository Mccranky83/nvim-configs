return {
  "neanias/everforest-nvim",
  priority = 1000, -- make sure to load this before all the other start plugins

  -- Optional; default configuration will be used if setup isn't called.
  config = function()
    -- load the colorscheme here
    vim.cmd([[colorscheme everforest]])
  end,
}
