return {
  "wfxr/minimap.vim",
  event = "VeryLazy",
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

    local previous_win_id = nil
    local minimap_win_id = nil

    vim.keymap.set("n", "<leader>mm", function()
      if minimap_win_id and vim.api.nvim_win_is_valid(minimap_win_id) then
        -- Minimap is open, close it and switch back to the previous window
        vim.fn.win_gotoid(previous_win_id)
        vim.cmd("MinimapToggle")
        minimap_win_id = nil
      else
        -- Minimap is not open, open it and store the current window ID
        previous_win_id = vim.api.nvim_get_current_win()
        vim.cmd("MinimapToggle")
      end
    end, { desc = "Toggle minimap" })

    -- Autocommand to store minimap window ID when cursor moves to it
    vim.api.nvim_create_autocmd("WinEnter", {
      callback = function()
        if vim.bo.filetype == "minimap" then
          minimap_win_id = vim.api.nvim_get_current_win()
        end
      end,
    })

    -- Autocommand to check if current window is minimap window when :q is run
    vim.api.nvim_create_autocmd("QuitPre", {
      callback = function()
        if vim.api.nvim_get_current_win() == minimap_win_id then
          vim.fn.win_gotoid(previous_win_id)
        end
      end,
    })
  end,
}
