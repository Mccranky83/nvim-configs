return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = { "BufEnter" },
  config = function()
    require("copilot").setup({
      panel = {
        enabled = false,
      },
      suggestion = {
        enabled = false,
        auto_trigger = false,
        debounce = 75,
        keymap = {
          accept = "<D-;>",
          accept_word = "<D-l>",
          accept_line = false,
          next = "<D-]>",
          prev = "<D-[>",
          dismiss = "<Esc>",
        },
      },
      filetypes = {
        sh = function()
          -- disable for .env files
          if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), "^%.env.*") then
            return false
          end
          return true
        end,
        ["*"] = true, -- toggle for all other filetypes and ignore default `filetypes`
      },
      copilot_node_command = "node", -- Node.js version must be > 18.x
      server_opts_overrides = {
        trace = "verbose",
        settings = {
          advanced = {
            listCount = 10, -- #completions for panel
            inlineSuggestCount = 3, -- #completions for getCompletions
          },
        },
      },
    })
  end,
}
