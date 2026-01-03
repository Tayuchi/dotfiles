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

--  ウィンドウの外観設定
config.macos_window_background_blur = 20
config.window_background_opacity = 0.9
-- config.text_background_opacity = 0.9
config.window_padding = {
	left = 20,
	right = 20,
	top = 20,
	bottom = 20,
}

-- Tabバーの設定
config.show_new_tab_button_in_tab_bar = false
config.show_close_tab_button_in_tabs = false
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

-- タブのタイトルフォーマットをカスタマイズ
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local title = tab.active_pane.title
	if title == "" then
		title = tab.active_pane.foreground_process_name
	end
	return string.format(" %d %s ", tab.tab_index + 1, title)
end)

-- カラー設定
local warm_dark_color = "#181616" -- 温かみのある暗色
local white_cream_color = "#DCD7BA" -- テキスト色（クリーム系）
local light_gray_color = "#727169" -- 薄い灰色

config.colors = {
	background = warm_dark_color,
	foreground = white_cream_color,
	cursor_bg = white_cream_color,
	cursor_fg = warm_dark_color,
	cursor_border = white_cream_color,
	tab_bar = {
		background = warm_dark_color,
		active_tab = {
			bg_color = warm_dark_color,
			fg_color = white_cream_color,
			intensity = "Bold",
		},
		inactive_tab = {
			bg_color = warm_dark_color,
			fg_color = light_gray_color,
		},
		inactive_tab_hover = {
			bg_color = "#1F1F28",
			fg_color = white_cream_color,
		},
		new_tab = {
			bg_color = warm_dark_color,
			fg_color = light_gray_color,
		},
		new_tab_hover = {
			bg_color = "#1F1F28",
			fg_color = white_cream_color,
		},
	},
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
