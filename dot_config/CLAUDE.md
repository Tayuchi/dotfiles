# .config ディレクトリ構成ガイド

このディレクトリには、開発環境の設定ファイルが含まれています。

## 📁 ディレクトリ構造

```
.config/
├── CLAUDE.md           # このファイル
├── nvim/               # Neovim設定
├── wezterm/            # WeztermターミナルエミュレータURL設定
├── git/                # Git設定
├── github-copilot/     # GitHub Copilot設定
└── chezmoi/            # dotfile管理ツール設定
```

## 🛠️ Neovim設定 (`nvim/`)

### 構成

Neovim設定はLazy.nvimプラグインマネージャーを使用したモダンな構成です。

```
nvim/
├── init.lua                    # エントリーポイント
├── lazy-lock.json              # プラグインバージョンロックファイル
├── lua/
│   ├── config/                 # 基本設定
│   │   ├── lazy.lua           # Lazy.nvim設定
│   │   ├── options.lua        # エディタオプション
│   │   ├── keymaps.lua        # キーマッピング
│   │   └── autocmds.lua       # 自動コマンド
│   └── plugins/               # プラグイン設定（各ファイルが1プラグイン）
│       ├── lsp.lua            # LSP設定（gopls）
│       ├── nvim-cmp.lua       # 補完設定
│       ├── telescope.lua      # ファジーファインダー
│       ├── treesitter.lua     # シンタックスハイライト
│       ├── copilot.lua        # GitHub Copilot
│       ├── copilot-chat.lua   # Copilot Chat
│       ├── copilot-cmp.lua    # Copilot補完統合
│       ├── diffview.lua       # Git差分ビューア
│       ├── nvim-tree.lua      # ファイルエクスプローラー
│       ├── lualine.lua        # ステータスライン
│       ├── colorscheme.lua    # カラースキーム
│       ├── conform.lua        # フォーマッター
│       ├── format.lua         # フォーマット設定
│       ├── lint.lua           # リンター
│       ├── dap.lua            # デバッガー
│       ├── test.lua           # テストランナー
│       ├── hlchunk.lua        # インデント可視化
│       ├── auto-save.lua      # 自動保存
│       └── nio.lua            # 非同期IO
```

### 主要な設定

#### エディタオプション ([options.lua](nvim/lua/config/options.lua))
- 行番号表示（相対行番号有効）
- タブ幅: 2スペース
- 垂直分割時に右側に開く

#### キーマップ ([keymaps.lua](nvim/lua/config/keymaps.lua))
- `¥` → `\` (バックスラッシュとして扱う)

#### LSP設定 ([lsp.lua](nvim/lua/plugins/lsp.lua))
- **重要**: Neovim 0.11+対応の新しい`vim.lsp.config` APIを使用
- Mason.nvimでLSPサーバー管理
- Go開発用にgoplsを設定
  - gofumpt有効化
  - staticcheck有効化
  - プレースホルダー使用
  - 未インポートパッケージの補完有効化

### プラグイン一覧

| プラグイン | 用途 |
|-----------|------|
| lazy.nvim | プラグインマネージャー |
| mason.nvim | LSPサーバー/ツールインストーラー |
| nvim-lspconfig | LSP設定（Neovim 0.11+では`vim.lsp.config`を推奨） |
| nvim-cmp | 補完エンジン |
| telescope.nvim | ファジーファインダー |
| nvim-treesitter | シンタックスハイライト |
| copilot.vim / copilot-chat.nvim | AI補完 |
| nvim-tree.lua | ファイルエクスプローラー |
| lualine.nvim | ステータスライン |
| conform.nvim | フォーマッター |
| nvim-lint | リンター |
| nvim-dap | デバッガー |
| diffview.nvim | Git差分ビューア |

### プラグインの追加方法

1. `lua/plugins/` ディレクトリに新しい `.lua` ファイルを作成
2. プラグイン定義をreturn文で記述:

```lua
return {
  "author/plugin-name",
  config = function()
    -- 設定をここに記述
  end,
}
```

3. Neovimを再起動すると自動的に読み込まれます

## 🖥️ Wezterm設定 (`wezterm/`)

### 主要な設定 ([wezterm.lua](wezterm/wezterm.lua))

#### 外観
- フォント: BitstromWera Nerd Font (12pt)
- カラースキーム: Kanagawa (dragon)
- 背景の透明度: 0.9
- 背景ぼかし（macOS）: 20
- ウィンドウパディング: 20px

#### キーバインド（macOS）
| キー | 動作 |
|------|------|
| `Cmd+D` | 左右に分割 |
| `Cmd+Shift+D` | 上下に分割 |
| `Cmd+W` | ペインを閉じる |
| `Cmd+H/J/K/L` | ペイン間移動（Vim風） |
| `Cmd+Alt+H/J/K/L` | ペインサイズ変更 |
| `Alt+Left/Right` | 単語単位で移動 |
| `Shift+Enter` | Shift+Enter送信 |
| `Shift+Cmd+F` / `Ctrl+Cmd+F` | フルスクリーン切替 |

## 🎨 開発環境の特徴

### Go開発向け最適化
- gopls LSPサーバー自動インストール
- gofumptフォーマッター統合
- staticcheck静的解析
- DAP（デバッグアダプタプロトコル）対応

### AI統合
- GitHub Copilot
- Copilot Chat
- nvim-cmp統合による補完

### コード品質
- Treesitterによる正確なシンタックスハイライト
- Conform.nvimによる自動フォーマット
- nvim-lintによる自動リンティング
- 自動保存機能

## 🔧 メンテナンス

### Neovimプラグインの更新
```bash
# Neovim内で実行
:Lazy update
```

### LSPサーバーの管理
```bash
# Neovim内で実行
:Mason
```

### 設定の再読み込み
```bash
# Neovim内で実行
:source %
```

## 📝 設定変更時の注意事項

### LSP設定 ([lsp.lua](nvim/lua/plugins/lsp.lua))
- Neovim 0.11以降では`vim.lsp.config` APIを使用
- 従来の`require('lspconfig').server.setup()`は非推奨
- 新しいLSPサーバーを追加する場合:
  1. Masonで`ensure_installed`にサーバー名を追加
  2. `vim.lsp.config.{server}`で設定
  3. `vim.lsp.enable("{server}")`で有効化

### プラグイン設定の編集
- 各プラグインは独立した`.lua`ファイルで管理
- 変更後は`:source %`で即座に反映
- Lazy.nvimが自動的に変更を検知

### カラースキームの変更
- Neovim: [colorscheme.lua](nvim/lua/plugins/colorscheme.lua)
- Wezterm: [wezterm.lua](wezterm/wezterm.lua)の`config.color_scheme`

## 🚨 トラブルシューティング

### LSP関連のエラー
```bash
# LSPサーバーのログ確認
:LspLog

# LSPサーバーの再起動
:LspRestart
```

### プラグインの問題
```bash
# Lazy.nvimの状態確認
:Lazy

# プラグインの再インストール
:Lazy clean
:Lazy install
```

### 設定ファイルの構文エラー
```bash
# Luaファイルの構文チェック
luac -p {file.lua}
```

## 🔗 関連リンク

- [Neovim Documentation](https://neovim.io/doc/)
- [Lazy.nvim](https://github.com/folke/lazy.nvim)
- [Mason.nvim](https://github.com/williamboman/mason.nvim)
- [Wezterm Documentation](https://wezfurlong.org/wezterm/)
- [Neovim LSP Guide](https://neovim.io/doc/user/lsp.html)

---

**最終更新**: 2026-01-18
**Neovimバージョン**: 0.11+対応
