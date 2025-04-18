vim.cmd("packadd packer.nvim")

vim.g.sonokai_disable_italic_comment = 1

return require("packer").startup(function(use)
	use({ "tpope/vim-fugitive" })
	use({ "tpope/vim-surround" })
	use({ "editorconfig/editorconfig-vim" })

	use({
		"haserl.vim",
		config = function()
			local url = "https://grimblefritz.com/haserl/haserl.vim"
			local syntax_dir = vim.fn.stdpath("config") .. "/syntax/"
			print(syntax_dir)
			local syntax_file = syntax_dir .. "haserl.vim"

			vim.fn.mkdir(syntax_dir, "p")

			if vim.fn.filereadable(syntax_file) == 0 then
				local cmd = string.format("curl -fsSL -o %s %s", syntax_file, url)
				os.execute(cmd)
			end
		end,
	})

	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({})

			vim.api.nvim_set_keymap("n", "<leader>cc", "<cmd>TodoQuickFix<cr>", { noremap = true })
		end,
	})

	use({
		"thekhanj/sonokai",
		config = function()
			vim.cmd("colorscheme sonokai")
		end,
	})

	use({
		"glacambre/firenvim",
		run = function()
			vim.fn["firenvim#install"](0)
		end,
	})

	vim.g.firenvim_config = {
		localSettings = {
			[".*"] = {
				takeover = "never",
			},
		},
	}

	use({
		"mhartington/formatter.nvim",
		config = function()
			vim.api.nvim_set_keymap("n", "<leader>a", "<cmd>Format<cr>", { noremap = true, silent = true })

			require("formatter").setup({
				filetype = {
					sourcepawn = {
						function()
							return {
								exe = "sh",
								args = {
									"-c",
									"echo | sp_format"
										.. " --breaks-before-enum 1"
										.. " --breaks-before-enum-struct 1"
										.. " --breaks-before-function-decl 1"
										.. " --breaks-before-function-def 1"
										.. " --breaks-before-methodmap 1",
								},
								stdin = false,
							}
						end,
					},
					sql = {
						require("formatter.filetypes.sql").pgformat,
					},
					javascript = {
						require("formatter.filetypes.javascript").prettierd,
					},
					javascriptreact = {
						require("formatter.filetypes.javascriptreact").prettierd,
					},
					typescript = {
						require("formatter.filetypes.typescript").prettierd,
					},
					typescriptreact = {
						require("formatter.filetypes.typescriptreact").prettierd,
					},
					html = {
						require("formatter.filetypes.html").prettierd,
					},
					xml = {
						require("formatter.filetypes.xml").tidy,
					},
					dart = {
						require("formatter.filetypes.dart").dartformat,
					},
					php = {
						function()
							return {
								exe = "php-cs-fixer",
								args = { "fix", "--rules=@Symfony,@PSR1,@PSR2,@PSR12" },
								stdin = false,
								ignore_exitcode = true,
							}
						end,
					},
					python = {
						require("formatter.filetypes.python").black,
					},
					rust = {
						require("formatter.filetypes.rust").rustfmt,
					},
					cpp = {
						require("formatter.filetypes.cpp").clangformat,
					},
					arduino = {
						require("formatter.filetypes.cpp").clangformat,
					},
					c = {
						require("formatter.filetypes.c").clangformat,
					},
					go = {
						require("formatter.filetypes.go").gofumpt,
					},
					sh = {
						require("formatter.filetypes.sh").shfmt,
					},
					json = {
						require("formatter.filetypes.json").jq,
					},
					jsonc = {
						require("formatter.filetypes.json").prettierd,
					},
					yaml = {
						require("formatter.filetypes.yaml").prettierd,
					},
					lua = {
						require("formatter.filetypes.lua").stylua,
					},
				},
			})
		end,
	})

	use({
		"christoomey/vim-tmux-navigator",
		config = function()
			vim.g.tmux_navigator_no_mappings = 1

			vim.api.nvim_set_keymap("n", "<a-h>", "<cmd>TmuxNavigateLeft<cr>", { noremap = true })
			vim.api.nvim_set_keymap("t", "<a-h>", "<cmd>TmuxNavigateLeft<cr>", { noremap = true })
			vim.api.nvim_set_keymap("n", "<a-j>", "<cmd>TmuxNavigateDown<cr>", { noremap = true })
			vim.api.nvim_set_keymap("t", "<a-j>", "<cmd>TmuxNavigateDown<cr>", { noremap = true })
			vim.api.nvim_set_keymap("n", "<a-k>", "<cmd>TmuxNavigateUp<cr>", { noremap = true })
			vim.api.nvim_set_keymap("t", "<a-k>", "<cmd>TmuxNavigateUp<cr>", { noremap = true })
			vim.api.nvim_set_keymap("n", "<a-l>", "<cmd>TmuxNavigateRight<cr>", { noremap = true })
			vim.api.nvim_set_keymap("t", "<a-l>", "<cmd>TmuxNavigateRight<cr>", { noremap = true })
		end,
	})

	use({
		"nvim-tree/nvim-tree.lua",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			vim.api.nvim_set_keymap("n", "<c-\\>", "<cmd>NvimTreeFocus<cr>", { noremap = true })

			require("nvim-tree").setup({
				sync_root_with_cwd = true,
				update_focused_file = {
					enable = true,
					update_cwd = false,
					ignore_list = {},
				},
				view = {
					width = 35,
				},
				renderer = {
					highlight_opened_files = "all",
				},
			})
		end,
	})

	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
		config = function()
			local ivy = require("telescope.themes").get_ivy()
			ivy["sorting_strategy"] = "descending"
			ivy["layout_config"]["prompt_position"] = "bottom"

			require("telescope").setup({
				defaults = ivy,
			})

			vim.api.nvim_set_keymap("n", "<leader>tf", "<cmd>Telescope find_files<cr>", { noremap = true })
			vim.api.nvim_set_keymap("n", "<leader>tg", "<cmd>Telescope live_grep<cr>", { noremap = true })
			vim.api.nvim_set_keymap("n", "<leader>tb", "<cmd>Telescope buffers<cr>", { noremap = true })
			vim.api.nvim_set_keymap("n", "<leader>tr", "<cmd>Telescope resume<cr>", { noremap = true })
			vim.api.nvim_set_keymap("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { noremap = true })
			vim.api.nvim_set_keymap("n", "<leader>gbc", "<cmd>Telescope git_bcommits<cr>", { noremap = true })
			vim.api.nvim_set_keymap("n", "<leader>gB", "<cmd>Telescope git_branches<cr>", { noremap = true })
			vim.api.nvim_set_keymap("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { noremap = true })
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"typescript",
					"javascript",
					"java",
					"php",
					"lua",
					"c",
					"cpp",
					"vim",
				},
				highlight = {
					enable = true,
				},
			})

			vim.opt.foldmethod = "indent"
			vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
			vim.opt.foldlevel = 99
		end,
	})

	use({
		"neoclide/coc.nvim",
		run = "yarn install --frozen-lockfile",
		config = function()
			vim.opt.updatetime = 200
			vim.api.nvim_set_keymap("i", "<c-space>", "coc#refresh()", { noremap = true, silent = true, expr = true })
			vim.api.nvim_set_keymap("n", "gd", "<Plug>(coc-definition)", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "gD", "<Plug>(coc-declaration)", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "gi", "<Plug>(coc-implementation)", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "gr", "<Plug>(coc-references)", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<leader>cw", "<Plug>(coc-rename)", { noremap = true, silent = true })
			vim.api.nvim_set_keymap(
				"n",
				"K",
				'<cmd>call CocActionAsync("doHover")<cr>',
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>z",
				"<Plug>(coc-codeaction-selected)<cr>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"i",
				"<cr>",
				'coc#pum#visible() ? coc#pum#confirm() : "<C-g>u<CR><c-r>=coc#on_enter()<CR>"',
				{ noremap = true, silent = true, expr = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>cf",
				"<cmd>CocCommand workspace.renameCurrentFile<cr>",
				{ noremap = true, silent = true }
			)
		end,
	})
end)
