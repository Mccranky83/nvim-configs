return {
  "numToStr/FTerm.nvim",
  config = function()
    local fterm = require("FTerm")

    fterm.setup({
      dimensions = {
        height = 0.8,
        width = 0.8,
        x = 0.5,
        y = 0.5,
      },
      border = "single",
    })

    local btop = fterm:new({
      ft = "fterm_btop",
      cmd = "btop",
    })

    -- Keybinds
    vim.keymap.set("n", "<leader>nt", "<CMD>FTermToggle<CR>")
    vim.keymap.set("n", "<leader>np", function()
      btop:toggle()
    end, { desc = "Toggle btop" })

    -- Create custom commands
    vim.api.nvim_create_user_command("FTermOpen", require("FTerm").open, { bang = true })
    vim.api.nvim_create_user_command("FTermClose", require("FTerm").close, { bang = true })
    vim.api.nvim_create_user_command("FTermExit", require("FTerm").exit, { bang = true })
    vim.api.nvim_create_user_command("FTermToggle", require("FTerm").toggle, { bang = true })
  end,
}
