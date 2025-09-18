return {
  "tpope/vim-dadbod",
  event = { "VimEnter" },
  dependencies = {
    "tpope/vim-dotenv",
    "kristijanhusak/vim-dadbod-completion",
    "kristijanhusak/vim-dadbod-ui",
  },
  config = function()
    local path = "~/.env"

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "sql", "mysql", "plsql", "psql" },
      callback = function()
        vim.cmd("Dotenv " .. path)
        require("cmp").setup.buffer({
          sources = {
            { name = "vim-dadbod-completion" },
            { name = "buffer" },
          },
        })
      end,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "DBUIReady",
      callback = function()
        vim.cmd("Dotenv" .. path)
      end,
    })
  end,
}
