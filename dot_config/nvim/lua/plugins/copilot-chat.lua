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
			width = 0.5,
		},
		auto_insert_mode = true,
	},

	config = function(_, opts)
		require("CopilotChat").setup(opts)
	end,
}
