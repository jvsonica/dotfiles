-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map("n", "<leader>fl", "<cmd>e!<cr>", { desc = "Force Reload File" })

-- Quickfix navigation
map("n", "<C-M-j>", ":cnext<CR>", { silent = true, desc = "Next Quickfix Item" })
map("n", "<C-M-k>", ":cprev<CR>", { silent = true, desc = "Previous Quickfix Item" })
