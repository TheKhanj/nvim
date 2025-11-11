-- Shortcuts
vim.api.nvim_set_keymap("", ";", ":", { noremap = true })
vim.api.nvim_set_keymap("", ":", ";", { noremap = true })
vim.api.nvim_set_keymap("", "vv", "V", { noremap = true })
vim.api.nvim_set_keymap("i", "kj", "<esc>", { noremap = true })

-- Buffer
vim.api.nvim_set_keymap("", "<c-h>", "10zh", { noremap = true })
vim.api.nvim_set_keymap("", "<c-l>", "10zl", { noremap = true })

-- Quickfix
vim.api.nvim_set_keymap("", "<c-n>", "<cmd>cne<cr>", { noremap = true })
vim.api.nvim_set_keymap("", "<c-p>", "<cmd>cpr<cr>", { noremap = true })
vim.api.nvim_set_keymap("", "<a-n>", "<cmd>lne<cr>", { noremap = true })
vim.api.nvim_set_keymap("", "<a-p>", "<cmd>lpr<cr>", { noremap = true })
