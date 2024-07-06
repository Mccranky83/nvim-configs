return {
  "max397574/better-escape.nvim",
  config = function()
    -- Replacement for deprecated clear_empty_lines method
    local clear_empty_lines = function()
      vim.api.nvim_input("<esc>")
      local current_line = vim.api.nvim_get_current_line()
      if current_line:match("^%s+$") then
        vim.schedule(function()
          vim.api.nvim_set_current_line("")
        end)
      end
    end
    require("better_escape").setup({
      timeout = vim.o.timeoutlen,
      mappings = {
        i = {
          j = {
            k = "<Esc>",
            j = "<Esc>",
            l = clear_empty_lines,
          },
        },
        c = {
          j = {
            k = "<Esc>",
            j = "<Esc>",
          },
        },
        t = {
          j = {
            k = "<Esc>",
            j = "<Esc>",
          },
        },
        v = {
          j = {
            k = "<Esc>",
          },
        },
        s = {
          j = {
            k = "<Esc>",
          },
        },
      },
    })
  end,
}
