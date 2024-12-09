return {
  "zbirenbaum/copilot-cmp",
  event = "VeryLazy",
  after = { "copilot.lua", "nvim-cmp" }, -- race condition
  dependencies = {
    { "uga-rosa/cmp-dictionary", lazy = true },
  },
  config = function()
    local cmp = require("cmp")

    local lspkind = require("lspkind")

    lspkind.init({
      symbol_map = {
        Copilot = "",
      },
    })

    local has_words_before = function()
      if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
        return false
      end
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
    end

    require("cmp_dictionary").setup({
      paths = { "/usr/share/dict/words" },
      exact_length = 2,
      first_case_insensitive = true,
    })

    require("copilot_cmp").setup({
      event = { "InsertEnter", "LspAttach" },
      fix_pairs = true,
    })

    cmp.setup({
      sources = {
        { name = "nvim_lsp", group_index = 2 },
        { name = "path", group_index = 2 },
        { name = "buffer", group_index = 2 },
        { name = "luasnip", group_index = 2 },
        { name = "copilot", max_item_count = 3, group_index = 2 },
        {
          name = "dictionary",
          max_item_count = 10,
          keyword_length = 2,
          group_index = 2,
        },
      },
      formatting = {
        format = lspkind.cmp_format({
          -- mode = "symbol", -- no text
          max_width = 50,
          symbol_map = { Copilot = "" },
          ellipsis_char = "...",
        }),
      },
      mapping = {
        ["<Tab>"] = vim.schedule_wrap(function(fallback)
          if cmp.visible() and has_words_before() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          else
            fallback()
          end
        end),
      },
      sorting = {
        priority_weight = 2,
        comparators = {
          require("copilot_cmp.comparators").prioritize,
          -- Below is the default comparitor list and order for nvim-cmp
          cmp.config.compare.offset,
          -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
          cmp.config.compare.exact,
          cmp.config.compare.score,
          cmp.config.compare.recently_used,
          cmp.config.compare.locality,
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      },
    })
  end,
}
