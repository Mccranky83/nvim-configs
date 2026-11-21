return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    local colors = {
      bg0 = "#323d43",
      bg1 = "#3c474d",
      bg3 = "#505a60",
      fg = "#d8caac",
      aqua = "#87c095",
      green = "#a7c080",
      orange = "#e39b7b",
      purple = "#d39bb6",
      red = "#e68183",
      grey1 = "#868d80",
    }

    local everforest_theme = {
      normal = {
        a = { bg = colors.green, fg = colors.bg0, gui = "bold" },
        b = { bg = colors.bg3, fg = colors.fg },
        c = { bg = colors.bg1, fg = colors.fg },
      },
      insert = {
        a = { bg = colors.fg, fg = colors.bg0, gui = "bold" },
        b = { bg = colors.bg3, fg = colors.fg },
        c = { bg = colors.bg1, fg = colors.fg },
      },
      visual = {
        a = { bg = colors.red, fg = colors.bg0, gui = "bold" },
        b = { bg = colors.bg3, fg = colors.fg },
        c = { bg = colors.bg1, fg = colors.fg },
      },
      replace = {
        a = { bg = colors.orange, fg = colors.bg0, gui = "bold" },
        b = { bg = colors.bg3, fg = colors.fg },
        c = { bg = colors.bg1, fg = colors.fg },
      },
      command = {
        a = { bg = colors.aqua, fg = colors.bg0, gui = "bold" },
        b = { bg = colors.bg3, fg = colors.fg },
        c = { bg = colors.bg1, fg = colors.fg },
      },
      terminal = {
        a = { bg = colors.purple, fg = colors.bg0, gui = "bold" },
        b = { bg = colors.bg3, fg = colors.fg },
        c = { bg = colors.bg1, fg = colors.fg },
      },
      inactive = {
        a = { bg = colors.bg1, fg = colors.grey1, gui = "bold" },
        b = { bg = colors.bg1, fg = colors.grey1 },
        c = { bg = colors.bg1, fg = colors.grey1 },
      },
    }

    -- configure lualine with modified theme
    lualine.setup({
      options = {
        theme = everforest_theme,
      },
      sections = {
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
      },
    })
  end,
}
