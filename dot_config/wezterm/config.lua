local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local act = wezterm.action
local mux = wezterm.mux

-- 起動時のウィンドウサイズと位置
wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {width=240, height=65})
  window:gui_window():maximize()
end)

--------------------------------------------------------------------------------
-- 基本設定
--------------------------------------------------------------------------------
-- 自動リロード設定
config.automatically_reload_config = true
-- フォントとカラースキームの設定
config.font = wezterm.font("BitstromWera Nerd Font")
config.font_size = 12.0
config.color_scheme = "Kanagawa (dragon)"
config.macos_window_background_blur = 10
config.window_background_opacity = 0.9
config.text_background_opacity = 0.5
config.colors = {
  background = "#181616",    -- 温かみのある暗色
  foreground = "#DCD7BA",    -- テキスト色（クリーム系）
  cursor_bg = "#DCD7BA",     -- ほんのり黄みがかったクリーム
  cursor_fg = "#1F1F28",     -- カーソル上の文字を暗めで反転させる
  cursor_border = "#DCD7BA", -- 枠線も同じ色で自然に
}

--------------------------------------------------------------------------------
-- キーバインド
--------------------------------------------------------------------------------
config.keys = {
  -- フルスクリーン切替
  { key = "f", mods = "SHIFT|META", action = act.ToggleFullScreen }, -- Shift+Cmd+F
  { key = 'f', mods = 'CTRL|CMD', action = wezterm.action.ToggleFullScreen }, -- Ctrl+Cmd+F

  -- ペイン分割
  { key = 'd', mods = 'CMD', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } }, -- Cmd+D: 左右に分割
  { key = 'd', mods = 'CMD|SHIFT', action = act.SplitVertical { domain = 'CurrentPaneDomain' } }, -- Cmd+Shift+D: 上下に分割

  -- ペインを閉じる
  { key = 'w', mods = 'CMD', action = act.CloseCurrentPane { confirm = true } }, -- Cmd+W: ペインを閉じる
}

return config
