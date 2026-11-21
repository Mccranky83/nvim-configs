return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      panel = {
        enabled = false,
      },
      suggestion = {
        enabled = false,
      },
      filetypes = {
        sh = function()
          if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), "^%.env.*") then
            return false
          end
          return true
        end,
        ["*"] = true,
      },
      logger = {
        trace_lsp = "off",
      },
    })
  end,
}
