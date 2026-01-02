return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- アイコン表示
	config = function()
		require("nvim-tree").setup({
			view = {
				width = 30,
				side = "left",
				number = true,
				relativenumber = true,
			},
			renderer = {
				highlight_opened_files = "all",
			},
			filters = {
				dotfiles = false, -- ドットファイルを表示
			},
		})

		-- キーバインド（VSCode風）
		vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file tree" })
	end,
}
