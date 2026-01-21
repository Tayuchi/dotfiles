local map = vim.keymap.set

--------------------------------------------------------------------------------
-- 基本設定
--------------------------------------------------------------------------------
-- ¥ をバックスラッシュとして扱う
map({ "n", "v", "i", "c" }, "¥", "\\", { noremap = true })

-- ctrl+s で保存して終了
-- map("n", "<c-s>", ":wq<cr>", { noremap = true, silent = true, desc = "save and quit" })

--------------------------------------------------------------------------------
-- telescope
--------------------------------------------------------------------------------
map("n", "<leader>ff", function()
	require("telescope.builtin").find_files()
end, { desc = "telescope find files" })

map("n", "<leader>fg", function()
	require("telescope.builtin").live_grep()
end, { desc = "telescope live grep" })

map("n", "<leader>fb", function()
	require("telescope.builtin").buffers()
end, { desc = "telescope buffers" })

map("n", "<leader>fh", function()
	require("telescope.builtin").help_tags()
end, { desc = "telescope help tags" })

--------------------------------------------------------------------------------
-- nvim-tree
--------------------------------------------------------------------------------
map("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "toggle file tree" })

--------------------------------------------------------------------------------
-- copilotchat
--------------------------------------------------------------------------------
map("n", "<leader>cc", function()
	require("copilotchat").toggle()
end, { desc = "toggle copilotchat" })

map("n", "<leader>cq", function()
	require("copilotchat").reset()
end, { desc = "reset copilotchat" })

--------------------------------------------------------------------------------
-- neotest
--------------------------------------------------------------------------------
-- テスト実行
map("n", "<leader>tn", function()
	require("neotest").run.run()
end, { desc = "run nearest test" })

map("n", "<leader>tf", function()
	require("neotest").run.run(vim.fn.expand("%"))
end, { desc = "run test file" })

map("n", "<leader>ta", function()
	require("neotest").run.run(vim.fn.getcwd())
end, { desc = "run all tests" })

map("n", "<leader>tl", function()
	require("neotest").run.run_last()
end, { desc = "run last test" })

-- テスト結果表示
map("n", "<leader>to", function()
	require("neotest").output.open({ enter = true })
end, { desc = "show test output" })

map("n", "<leader>ts", function()
	require("neotest").summary.toggle()
end, { desc = "toggle test summary" })

-- デバッグ
map("n", "<leader>td", function()
	require("neotest").run.run({ strategy = "dap" })
end, { desc = "debug nearest test" })

-- テスト停止
map("n", "<leader>tx", function()
	require("neotest").run.stop()
end, { desc = "stop test" })

--------------------------------------------------------------------------------
-- diagnostics (エラー表示)
--------------------------------------------------------------------------------
-- カーソル位置のエラー詳細をフロート表示
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "show line diagnostics" })

-- 前のエラーへ移動
map("n", "[d", vim.diagnostic.goto_prev, { desc = "goto prev diagnostic" })

-- 次のエラーへ移動
map("n", "]d", vim.diagnostic.goto_next, { desc = "goto next diagnostic" })

-- エラー一覧リストを表示
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "show diagnostics list" })

--------------------------------------------------------------------------------
-- LSP
--------------------------------------------------------------------------------
-- リネーム (変数名などの変更)
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "lsp rename" })
-- コードアクション (修正の提案など)
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "lsp code action" })
-- 定義へジャンプ
map("n", "gd", vim.lsp.buf.definition, { desc = "lsp goto definition" })


--------------------------------------------------------------------------------
-- diffview
--------------------------------------------------------------------------------
map("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "Diffview Open" })
map("n", "<leader>gD", "<cmd>DiffviewClose<cr>", { desc = "Diffview Close" })
map("n", "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", { desc = "File History" })


