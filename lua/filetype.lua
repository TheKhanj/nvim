vim.api.nvim_create_autocmd(
  { "FileType" },
  { pattern = "php", command = "setlocal tabstop=4" }
)

vim.api.nvim_create_autocmd(
  { "FileType" },
  { pattern = "php", command = "setlocal shiftwidth=4" }
)

vim.api.nvim_create_autocmd(
  { "FileType" },
  { pattern = "php", command = "setlocal softtabstop=4" }
)

vim.api.nvim_create_autocmd(
  { "FileType" },
  { pattern = "php", command = "setlocal autoindent" }
)
