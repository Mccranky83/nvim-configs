return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
			dependencies = {
				"rafamadriz/friendly-snippets",
			},
		},
		"saadparwaiz1/cmp_luasnip",
		"onsails/lspkind.nvim",
		{
			"zbirenbaum/copilot-cmp",
			dependencies = {
				"zbirenbaum/copilot.lua",
			},
		},
		{ "uga-rosa/cmp-dictionary" },
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		require("luasnip.loaders.from_vscode").lazy_load()

		require("cmp_dictionary").setup({
			paths = { "/usr/share/dict/words" },
			exact_length = 2,
			first_case_insensitive = true,
		})

		require("copilot_cmp").setup()

		local has_words_before = function()
			if vim.api.nvim_get_option_value("buftype", { buf = 0 }) == "prompt" then
				return false
			end
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
		end

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-l>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<C-j>"] = cmp.mapping.confirm({ select = true }),
				["<Tab>"] = vim.schedule_wrap(function(fallback)
					if cmp.visible() and has_words_before() then
						cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
					else
						fallback()
					end
				end),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "copilot", max_item_count = 3 },
				{ name = "luasnip" },
				{ name = "path" },
			}, {
				{ name = "buffer" },
				{ name = "dictionary", max_item_count = 10, keyword_length = 2 },
			}),
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 50,
					symbol_map = { Copilot = "" },
					ellipsis_char = "...",
				}),
			},
			sorting = {
				priority_weight = 2,
				comparators = {
					require("copilot_cmp.comparators").prioritize,
					cmp.config.compare.offset,
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
