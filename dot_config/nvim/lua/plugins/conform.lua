return {
  "stevearc/conform.nvim",
  dependencies = { "williamboman/mason.nvim" },
  config = function()
    require("mason").setup {
      ensure_installed = { "goimports", "gofumpt" },
    }

    require("conform").setup {
      formatters_by_ft = {
        go = { "goimports", "gofumpt" },
      },
      format_on_save = true,
    }
  end,
}

