return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "fredrikaverpil/neotest-golang",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-golang")({
          go_test_args = {
            "-v",
            "-race",
            "-count=1",
            "-timeout=60s",
          },
          dap_go_enabled = true,
          -- テスト検出の設定
          testify_enabled = true,
          warn_test_name_dupes = false,
          warn_test_not_executed = false,
        }),
      },
      discovery = {
        enabled = true,
        concurrent = 1,
      },
      diagnostic = {
        enabled = true,
      },
      status = {
        virtual_text = true,
        signs = true,
      },
    })
  end,
}
