return {
  "nvim-lualine/lualine.nvim",
  dependencies = { 'nvim-tree/nvim-web-devicons' },   
  opts = {
    options = {
      theme = "kanagawa", 
      globalstatus = true,
    },
    sections = {
      lualine_a = { "mode" },     -- ← INSERT / NORMAL / VISUAL を表示
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = { "filename" },
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
  }
}

