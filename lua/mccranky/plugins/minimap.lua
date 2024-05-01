return {
  "wfxr/minimap.vim",
  init = function()
    vim.g.minimap_width = 30
    vim.g.minimap_left = false
    vim.g.minimap_highlight_range = true
    vim.g.minimap_highlight_search = true
    vim.g.minimap_git_colors = true
  end,
  config = function()
    -- Custom highlights
    -- Cursor
    vim.api.nvim_command("hi MinimapCurrentLine ctermfg=Green guifg=#a7c080 guibg=#303030")
    vim.g.minimap_cursor_color = "MinimapCurrentLine"
    -- Range
    vim.api.nvim_command("hi MinimapRangeColor ctermfg=Green guifg=#d3c6aa guibg=#2d353b")
    vim.g.minimap_range_color = "MinimapRangeColor"

    vim.keymap.set("n", "<leader>mm", "<Cmd>MinimapToggle<CR>")
  end,
}
