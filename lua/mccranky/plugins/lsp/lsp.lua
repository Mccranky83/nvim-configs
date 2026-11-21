return {
  "hrsh7th/cmp-nvim-lsp",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/lazydev.nvim", opts = {} },
  },
  config = function()
    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- default handler for installed servers
    vim.lsp.config("*", {
      capabilities = capabilities,
    })

    -- manual overrides
    vim.lsp.config("clangd", {
      capabilities = {
        offsetEncoding = { "utf-16" },
        textDocument = { completion = { editsNearCursor = true } },
      },
    })

    vim.lsp.config("bashls", {
      filetypes = { "bash", "sh", "zsh" },
      settings = { bashIde = { globPattern = "*@(.sh|.inc|.bash|.zsh|.command)" } },
    })

    vim.lsp.config("emmet_ls", {
      filetypes = {
        "html",
        "typescriptreact",
        "javascriptreact",
        "css",
        "sass",
        "scss",
        "less",
        "markdown",
      },
    })

    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          completion = {
            callSnippet = "Replace",
          },
        },
      },
    })

    vim.lsp.config("harper_ls", {
      settings = {
        ["harper-ls"] = {
          linters = {
            SentenceCapitalization = false,
          },
          diagnosticSeverity = "hint", -- "hint", "information", "warning", or "error"
        },
      },
    })
  end,
}
