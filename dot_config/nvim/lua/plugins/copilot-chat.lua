return {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "main",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
  },
  opts = {
    debug = false,
    window = {
      layout = "vertical",
      width = 0.3,
    },
    auto_insert_mode = true,
  },
  
  config = function(_, opts)
    local chat = require("CopilotChat")
    chat.setup(opts)

    vim.keymap.set("n", "<leader>cc", function()
      chat.toggle()
    end, { desc = "Toggle CopilotChat" })

    vim.keymap.set("n", "<leader>cq", function()
      chat.reset()
    end, { desc = "Reset CopilotChat" })
  end,
}

