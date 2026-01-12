local map = vim.keymap.set

-- ¥ をバックスラッシュとして扱う
map({ "n", "v", "i", "c" }, "¥", "\\", { noremap = true })

-- Ctrl+s で保存して終了
-- map("n", "<C-s>", ":wq<CR>", { noremap = true, silent = true, desc = "Save and quit" })
