return {
  { "tpope/vim-dadbod", cmd = { "DB" } },
  {
    "kristijanhusak/vim-dadbod-ui",
    cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
    dependencies = { "tpope/vim-dadbod" },
    config = function()
      vim.g.dbs = {
        {
          name = "LocalMySQL",
          url = "mysql://root@localhost:3306/",
        },
        {
          name = "LocalMongo",
          url = "mongodb://localhost:27017/",
        },
      }
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
  {
    "kristijanhusak/vim-dadbod-completion",
    ft = { "sql", "mysql", "plsql", "psql" },
    dependencies = { "tpope/vim-dadbod" },
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "sql", "mysql", "plsql", "psql" },
        callback = function()
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
