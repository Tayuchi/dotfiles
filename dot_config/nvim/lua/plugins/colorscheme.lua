return {
  -- テーマ本体
  "rebelot/kanagawa.nvim",
  lazy = false,          -- 起動時に必ず読み込む
  priority = 1000,       -- いちばん最初に
  opts = {
    compile = false,     -- 速さ重視なら true でもOK（~/.cache に生成）
    transparent = false, -- 透過したいなら true
    dimInactive = false, -- 非アクティブウィンドウを暗くする
    terminalColors = true,
    theme = "dragon",      -- "wave" | "dragon" | "lotus"
    background = { dark = "dragon", light = "dragon" },
  },
  config = function(_, opts)
    require("kanagawa").setup(opts)
    vim.opt.termguicolors = true
    vim.cmd.colorscheme("kanagawa")
  end,
}