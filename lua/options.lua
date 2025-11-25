-- some servers have issues with backup files, see #649.
vim.opt.backup = false
vim.opt.writebackup = false

-- misc
vim.opt.compatible = false
vim.opt.swapfile = false

-- window title
vim.opt.title = true

-- enable sign column
vim.opt.signcolumn = "no"

-- virtual edit
vim.opt.virtualedit = "all"

-- mouse
vim.opt.mouse = "a"

-- wrap
vim.opt.wrap = false

-- Indent
vim.opt.list = true
vim.opt.cindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 0
vim.opt.softtabstop = -1
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.shiftround = true

-- scroll
vim.opt.scrolloff = 3

-- search
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "nosplit"

-- clipboard
vim.opt.clipboard = "unnamed,unnamedplus"

-- syntax
vim.cmd("syntax on")

-- line width
vim.opt.colorcolumn = "80"

if vim.g.started_by_firenvim then
	vim.opt.laststatus = 0
	vim.api.nvim_set_keymap(
		"n",
		"<c-b>z",
		"<cmd>set lines=100 | set columns=200<cr>",
		{ noremap = true, silent = true }
	)
end

vim.opt.cursorline = true

vim.opt.listchars = vim.opt.listchars + "tab:.."

vim.opt.termbidi = true
vim.opt.termguicolors = false

vim.opt.iskeyword = "@,48-57,_,192-255"
