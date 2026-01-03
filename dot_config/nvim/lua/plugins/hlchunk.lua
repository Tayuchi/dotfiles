return {
	"shellRaining/hlchunk.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("hlchunk").setup({
			-- chunk
			chunk = {
				enable = true,
				chars = {
					horizontal_line = "─",
					vertical_line = "│",
					left_top = "╭",
					left_bottom = "╰",
					right_arrow = ">",
				},
				style = "#806d9c",
				duration = 0,
				delay = 0,
			},

			-- indent
			indent = {
				enable = true,
			},

			-- line number
			line_num = {
				enable = true,
			},

			-- blank
			blank = {
				enable = false,
			},
		})
	end,
}
