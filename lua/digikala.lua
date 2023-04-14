function DigikalaChangeDirectory(project)
	local root = os.getenv("SUPERNOVA_DEV_DIR") .. "/vendor/"
	vim.api.nvim_command("cd " .. root .. project)
	print(vim.fn.getcwd())
end

vim.api.nvim_set_keymap(
	"",
	"<leader>sf",
	'<cmd>lua DigikalaChangeDirectory("digikala/supernova-digikala-firebolt")<cr>',
	{ noremap = true }
)

vim.api.nvim_set_keymap(
	"",
	"<leader>sF",
	'<cmd>lua DigikalaChangeDirectory("digikala/supernova-digikala-fulfillment")<cr>',
	{ noremap = true }
)

vim.api.nvim_set_keymap(
	"",
	"<leader>sS",
	'<cmd>lua DigikalaChangeDirectory("digikala/supernova")<cr>',
	{ noremap = true }
)

vim.api.nvim_set_keymap(
	"",
	"<leader>se",
	'<cmd>lua DigikalaChangeDirectory("digikala/evangeline")<cr>',
	{ noremap = true }
)

vim.api.nvim_set_keymap(
	"",
	"<leader>hh",
	'<cmd>lua DigikalaChangeDirectory("hypernova/hypernova")<cr>',
	{ noremap = true }
)

vim.api.nvim_set_keymap(
	"",
	"<leader>hw",
	'<cmd>lua DigikalaChangeDirectory("hypernova-packages/workflow-sdk")<cr>',
	{ noremap = true }
)

vim.api.nvim_set_keymap(
	"",
	"<leader>ha",
	'<cmd>lua DigikalaChangeDirectory("hypernova-packages/api-schema")<cr>',
	{ noremap = true }
)

vim.api.nvim_set_keymap(
	"",
	"<leader>ht",
	'<cmd>lua DigikalaChangeDirectory("hypernova-packages/http-client")<cr>',
	{ noremap = true }
)

vim.api.nvim_set_keymap("", "<leader>ss", '<cmd>lua DigikalaChangeDirectory("../")<cr>', { noremap = true })
