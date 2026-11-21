return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      -- list of servers for mason to install
      ensure_installed = {
        "eslint",
        "ts_ls",
        "html",
        "cssls",
        "emmet_ls",
        "lua_ls",
        "clangd",
        "pyright",
        "bashls",
        "texlab",
        "harper_ls",
      },
    },
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = {
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗",
            },
          },
        },
      },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        -- "eslint_d",
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "isort", -- python formatter
        "blue", -- python formatter
        "pylint", -- python linter
        "shfmt", -- shell formatter
        "shellcheck", -- shell linter
      },
    },
    dependencies = {
      "mason-org/mason.nvim",
    },
  },
}
