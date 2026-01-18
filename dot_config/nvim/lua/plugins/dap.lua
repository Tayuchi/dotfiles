return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "leoluz/nvim-dap-go",
    "williamboman/mason.nvim",
  },
  config = function()
    require("mason").setup {
      ensure_installed = { "delve" },
    }
    require("dap-go").setup()
  end,
}
