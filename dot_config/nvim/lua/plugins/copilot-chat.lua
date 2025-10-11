return {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "main",
  dependencies = {
    { "zbirenbaum/copilot.lua" },
    { "nvim-lua/plenary.nvim" },
  },
  opts = {
    debug = false,
  },
  config = function(_, opts)
    local chat = require("CopilotChat")
    chat.setup(opts)

    -- 🔹 キーマップ設定
    vim.keymap.set("n", "<leader>cc", chat.toggle, { desc = "Toggle CopilotChat" })
    vim.keymap.set("n", "<leader>cq", chat.reset, { desc = "Reset CopilotChat" })

    -- 🔧 CopilotChat ウィンドウを右側に移動＆幅35%に固定
    vim.api.nvim_create_autocmd({ "BufWinEnter", "WinNew" }, {
      callback = function(args)
        local ft = vim.bo[args.buf].filetype
        if ft == "copilot-chat" or ft == "CopilotChat" then
          -- 右側へ移動
          vim.cmd("wincmd L")
          -- 幅を画面の30%に
          local width = math.floor(vim.o.columns * 0.3)
          vim.cmd("vertical resize " .. width)
        end
      end,
    })
  end,
}
