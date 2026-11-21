return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    preset = "classic", -- "classic" | "modern" | "helix"
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = true,
        motions = true,
        text_objects = true,
        windows = true,
        nav = true,
        z = true,
        g = true,
      },
    },
    win = {
      border = "none",
      padding = { 1, 2 },
      wo = {
        winblend = 0,
      },
    },
    layout = {
      width = { min = 20, max = 50 },
      spacing = 3,
      align = "left",
    },
    icons = {
      breadcrumb = "»",
      separator = "➜",
      group = "+",
    },
    spec = {
      { "<leader>c", group = "Copilot / Code", mode = { "n", "v" } },
      { "<leader>e", group = "Diff / Edit" },
      { "<leader>f", group = "Find (Telescope)" },
      { "<leader>h", group = "Git Hunks / Harpoon", mode = { "n", "v" } },
      { "<leader>n", group = "Terminal / Tools" },
      { "<leader>u", group = "Undotree" },
      { "<leader>x", group = "Trouble Diagnostics" },
    },
  },
}
