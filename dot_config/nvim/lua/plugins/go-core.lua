return {
  -- LSP/ツールのインストーラ
  {
    "williamboman/mason.nvim",
    dependencies = {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    opts = {},
    config = function(_, opts)
      require("mason").setup(opts)
      require("mason-tool-installer").setup({
        ensure_installed = {
          -- LSP
          "gopls",
          -- Formatter
          "goimports", "gofumpt", "golines",
          -- Linter
          "golangci-lint",
          -- Debugger
          "delve",
        },
        auto_update = false,
        run_on_start = true,
      })
    end,
  },
}