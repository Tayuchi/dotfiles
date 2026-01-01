return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			go = { "gofumpt", "goimports", "golines" },
		},
		format_on_save = function(bufnr)
			local disabled = vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat
			if disabled then
				return
			end
			return { lsp_fallback = true, timeout_ms = 2000 }
		end,
	},
}
