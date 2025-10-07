return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    -- どちらか片方を選ぶ
    "nvim-neotest/neotest-go",       -- シンプル構成
    -- "fredrikaverpil/neotest-golang", -- 高機能アダプタ
  },
  config = function()
    local adapters = {}
    if pcall(require, "neotest-go") then
      table.insert(adapters, require("neotest-go"))
    elseif pcall(require, "neotest-golang") then
      table.insert(adapters, require("neotest-golang"))
    end
    require("neotest").setup({ adapters = adapters })
    -- キーマップ
    vim.keymap.set("n", "<leader>tn", function() require("neotest").run.run() end, { desc = "Nearest test" })
    vim.keymap.set("n", "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, { desc = "Test file" })
    vim.keymap.set("n", "<leader>to", function() require("neotest").output.open({ enter = true }) end, { desc = "Test output" })
  end,
}