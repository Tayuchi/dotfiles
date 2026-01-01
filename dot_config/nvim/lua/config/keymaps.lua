local map = vim.keymap.set

-- Ctrl + s で保存
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
