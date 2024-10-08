return {
  { "nvchad/volt", lazy = true },
  {
    "nvchad/minty",
    config = function()
      vim.keymap.set("n", "<leader>mc", function()
        require("minty.huefy").open({ border = true })
      end, { desc = "Color picker" })
      vim.keymap.set("n", "<leader>ms", function()
        require("minty.shades").open()
      end, { desc = "Color shades" })
    end,
  },
}
