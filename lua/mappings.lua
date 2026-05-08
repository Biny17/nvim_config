require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("i", "<C-d>", "<ESC>viw", { desc = "Visual select current word" })

-- Use <Esc> to exit terminal mode
map('t', '<Esc>', '<C-\\><C-n>')

-- Standard Telescope LSP references
map('n', 'gr', require('telescope.builtin').lsp_references, { desc = 'LSP References' })
map('n', 'gs', require('telescope.builtin').lsp_document_symbols, { desc = 'LSP Symbols'})
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
