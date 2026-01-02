local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action
local mux = wezterm.mux

-- 起動時のウィンドウサイズと位置
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or { width = 240, height = 65 })
	window:gui_window():maximize()
end)

--------------------------------------------------------------------------------
-- 基本設定
--------------------------------------------------------------------------------
-- 自動リロード設定
config.automatically_reload_config = true

-- OptionキーをAltキーとして認識させる（macOS）
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false

-- フォントとカラースキームの設定
config.font = wezterm.font("BitstromWera Nerd Font")
config.font_size = 12.0
config.color_scheme = "Kanagawa (dragon)"

config.macos_window_background_blur = 10
config.window_background_opacity = 0.9
config.text_background_opacity = 0.5
config.colors = {
	background = "#181616", -- 温かみのある暗色
	foreground = "#DCD7BA", -- テキスト色（クリーム系）
	cursor_bg = "#DCD7BA", -- ほんのり黄みがかったクリーム
	cursor_fg = "#1F1F28", -- カーソル上の文字を暗めで反転させる
	cursor_border = "#DCD7BA", -- 枠線も同じ色で自然に
}

--------------------------------------------------------------------------------
-- キーバインド
--------------------------------------------------------------------------------
config.keys = {
	-- Shift+Enter
	{ key = "Enter", mods = "SHIFT", action = act.SendString("\x1b\r") },

	-- ターミナル操作
	{ key = "RightArrow", mods = "ALT", action = act.SendKey({ key = "f", mods = "ALT" }) }, -- Alt+RightArrow: 単語単位で右へ移動
	{ key = "LeftArrow", mods = "ALT", action = act.SendKey({ key = "b", mods = "ALT" }) }, -- Alt+LeftArrow: 単語単位で左へ移動

	-- フルスクリーン切替
	{ key = "f", mods = "SHIFT|META", action = act.ToggleFullScreen }, -- Shift+Cmd+F
	{ key = "f", mods = "CTRL|CMD", action = wezterm.action.ToggleFullScreen }, -- Ctrl+Cmd+F

	-- ペイン分割
	{ key = "d", mods = "CMD", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) }, -- Cmd+D: 左右に分割
	{ key = "d", mods = "CMD|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) }, -- Cmd+Shift+D: 上下に分割

	-- ペインを閉じる
	{ key = "w", mods = "CMD", action = act.CloseCurrentPane({ confirm = true }) }, -- Cmd+W: ペインを閉じる

	-- ペイン間の移動
	{ key = "h", mods = "CMD", action = act.ActivatePaneDirection("Left") }, -- Cmd+H: 左のペインへ移動
	{ key = "l", mods = "CMD", action = act.ActivatePaneDirection("Right") }, -- Cmd+L: 右のペインへ移動
	{ key = "k", mods = "CMD", action = act.ActivatePaneDirection("Up") }, -- Cmd+K: 上のペインへ移動
	{ key = "j", mods = "CMD", action = act.ActivatePaneDirection("Down") }, -- Cmd+J: 下のペインへ移動

	-- ペインのサイズ変更
	{ key = "h", mods = "CMD|ALT", action = act.AdjustPaneSize({ "Left", 5 }) }, -- Cmd+Option+H: 左へ拡大
	{ key = "l", mods = "CMD|ALT", action = act.AdjustPaneSize({ "Right", 5 }) }, -- Cmd+Option+L: 右へ拡大
	{ key = "k", mods = "CMD|ALT", action = act.AdjustPaneSize({ "Up", 5 }) }, -- Cmd+Option+K: 上へ拡大
	{ key = "j", mods = "CMD|ALT", action = act.AdjustPaneSize({ "Down", 5 }) }, -- Cmd+Option+J: 下へ拡大
}

return config
