return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"go",
				"gomod",
				"gowork",
				"gosum",
				"lua",
				"vim",
				"vimdoc",
				"json",
				"yaml",
				"bash",
				"markdown",
				"markdown_inline",
			},
			highlight = { enable = true },
			indent = { enable = true },
			incremental_selection = { enable = true },
		})
	end,
}

