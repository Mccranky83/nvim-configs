return {
  "vidocqh/data-viewer.nvim",
  opts = {},
  dependencies = {
    "nvim-lua/plenary.nvim",
    "kkharji/sqlite.lua", -- Optional, sqlite support
  },
  config = function()
    local colors = {
      fg = "#d8caac",
      green = "#a7c080",
      blue = "#88c0d0",
      orange = "#e39b7b",
      red = "#e68183",
    }

    vim.api.nvim_set_hl(0, "DataViewerColumn0", { fg = colors.green, bg = "none" })
    vim.api.nvim_set_hl(0, "DataViewerColumn1", { fg = colors.blue, bg = "none" })
    vim.api.nvim_set_hl(0, "DataViewerColumn2", { fg = colors.orange, bg = "none" })
    vim.api.nvim_set_hl(0, "DataViewerFocusTable", { fg = colors.red, bg = "none", bold = true })

    require("data-viewer").setup({
      config = {
        autoDisplayWhenOpenFile = false,
        maxLineEachTable = 100,
        columnColorEnable = true,
        columnColorRoulette = { -- Highlight groups
          "DataViewerColumn0",
          "DataViewerColumn1",
          "DataViewerColumn2",
        },
        view = {
          float = true, -- False will open in current window
          width = 0.9, -- Less than 1 means ratio to screen width, valid when float = true
          height = 0.9, -- Less than 1 means ratio to screen height, valid when float = true
          zindex = 50, -- Valid when float = true
        },
        keymap = {
          quit = "q",
          next_table = "<C-l>",
          prev_table = "<C-h>",
        },
      },
    })
  end,
}
