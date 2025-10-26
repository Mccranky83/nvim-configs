return {
  { "tpope/vim-dadbod", cmd = { "DB" } },
  {
    "kristijanhusak/vim-dadbod-ui",
    cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
    dependencies = { "tpope/vim-dadbod", "tpope/vim-dotenv" },
    config = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "DBUIReady",
        callback = function()
          local path = "~/.env"
          vim.cmd("Dotenv " .. path)
        end,
      })
    end,
  },
  {
    "kristijanhusak/vim-dadbod-completion",
    ft = { "sql", "mysql", "plsql", "psql" },
    dependencies = { "tpope/vim-dadbod", "tpope/vim-dotenv" },
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "sql", "mysql", "plsql", "psql" },
        callback = function()
          local path = "~/.env"
          vim.cmd("Dotenv " .. path)
          require("cmp").setup.buffer({
            sources = {
              { name = "vim-dadbod-completion" },
              { name = "buffer" },
            },
          })
        end,
      })
    end,
  },
}
