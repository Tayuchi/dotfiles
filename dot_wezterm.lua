local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux

-- 起動時のウィンドウサイズと位置
wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {width=240, height=65})
  window:gui_window():set_position(85,0)
  window:set_inner_size(1000, 1000)
end)

return {
  -- 見た目
  font = wezterm.font("BitstromWera Nerd Font"),
  font_size = 12.0,
  color_scheme = "Kanagawa (dragon)",
  window_background_opacity = 0.8,
  text_background_opacity = 0.8,
  colors = {
    background = "#16161D",
    cursor_bg = "#DCD7BA",     -- ほんのり黄みがかったクリーム
    cursor_fg = "#1F1F28",     -- カーソル上の文字を暗めで反転させる
    cursor_border = "#DCD7BA", -- 枠線も同じ色で自然に
  },

  -- ショートカット
  keys = {
    { key = "f", mods = "SHIFT|META", action = act.ToggleFullScreen }, -- Shift+Cmd+F
    { key = 'f', mods = 'CTRL|CMD', action = wezterm.action.ToggleFullScreen }, -- Ctrl+Cmd+F
  },
}
