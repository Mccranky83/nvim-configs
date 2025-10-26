return {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    "zbirenbaum/copilot.lua",
    { "nvim-lua/plenary.nvim", branch = "master" },
  },
  build = "make tiktoken",
  event = "VeryLazy",
  opts = {
    show_help = true,
    auto_follow_cursor = true,
    auto_insert_mode = false,
    mappings = {
      accept_diff = {
        normal = "<C-t>",
        insert = "<C-t>",
      },
    },
  },
  keys = {
    { "<leader>cco", "<cmd>CopilotChatToggle<cr>", desc = "CopilotChat - Chat with Copilot" },
    { "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
    { "<leader>cct", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
    {
      "<leader>ccf",
      "<cmd>CopilotChatFixDiagnostic<cr>",
      desc = "CopilotChat - Fix diagnostic",
    },
    {
      "<leader>ccr",
      "<cmd>CopilotChatReset<cr>",
      desc = "CopilotChat - Reset chat history and clear buffer",
    },
  },
}
