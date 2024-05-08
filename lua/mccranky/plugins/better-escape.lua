return {
  "max397574/better-escape.nvim",
  config = function()
    require("better_escape").setup({
      mapping = { "jk", "jl", "Jk", "JK" },
      timeout = vim.o.timeoutlen, -- Use option timeoutlen by default
      clear_empty_lines = false,
      keys = function()
        return vim.api.nvim_win_get_cursor(0)[2] > 1 and "<esc>l" or "<esc>"
      end, -- keys used for escaping, if it is a function will use the result everytime
    })
  end,
}
