return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  branch = "main",
  build = ":TSUpdate",
  config = function()
    local treesitter = require("nvim-treesitter")

    treesitter.install({
      "json",
      "javascript",
      "typescript",
      "tsx",
      "yaml",
      "html",
      "css",
      "markdown",
      "markdown_inline",
      "bash",
      "lua",
      "vim",
      "vimdoc",
      "dockerfile",
      "gitignore",
      "query",
      "python",
      "c",
      "regex",
    })

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        pcall(vim.treesitter.start, args.buf)

        local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
        if lang and pcall(vim.treesitter.language.add, lang) then
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })

    vim.keymap.set("x", "<C-space>", "an", { desc = "Increment Treesitter node", remap = true })
    vim.keymap.set("x", "<bs>", "in", { desc = "Decrement Treesitter node", remap = true })
  end,
}
