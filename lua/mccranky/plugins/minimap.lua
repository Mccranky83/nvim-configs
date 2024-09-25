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

    -- Diff
    vim.api.nvim_command("hi MinimapDiffLine ctermfg=Green guifg=#e67e80 guibg=#2d353b")
    vim.g.minimap_diff_color = "MinimapDiffLine"

    vim.api.nvim_command("hi MinimapCursorDiffLine ctermfg=Green guifg=#d699b6 guibg=#303030")
    vim.g.minimap_cursor_diff_color = "MinimapCursorDiffLine"

    vim.api.nvim_command("hi MinimapRangeDiffLine ctermfg=Green guifg=#e67e80 guibg=#2d353b")
    vim.g.minimap_range_diff_color = "MinimapRangeDiffLine"

    local initial_win_id = vim.api.nvim_get_current_win()
    vim.keymap.set("n", "<leader>mm", function()
      vim.fn.win_gotoid(initial_win_id)
      vim.cmd("MinimapToggle")
    end)
  end,
}
