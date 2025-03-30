-- Insert mode escape shortcuts
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("i", "kk", "<Esc>")
vim.keymap.set("i", "hh", "<Esc>")

-- Disable arrow keys in normal mode
vim.keymap.set('n', '<Up>', '<Nop>')
vim.keymap.set('n', '<Down>', '<Nop>')
vim.keymap.set('n', '<Left>', '<Nop>')
vim.keymap.set('n', '<Right>', '<Nop>')

-- Disable arrow keys in insert mode
vim.keymap.set('i', '<Up>', '<Nop>')
vim.keymap.set('i', '<Down>', '<Nop>')
vim.keymap.set('i', '<Left>', '<Nop>')
vim.keymap.set('i', '<Right>', '<Nop>')

-- terminal mode out
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- normal mode keymaps
vim.keymap.set("n", "j", "gj", opt)
vim.keymap.set("n", "k", "gk", opt)

-- no hilgight when searching
vim.keymap.set("n", "<esc><esc>", "<cmd>nohlsearch<cr>", opt)
