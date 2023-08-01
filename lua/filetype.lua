local function spacify_filetype(filetype, tab_size)
	vim.api.nvim_create_autocmd({ "FileType" }, { pattern = filetype, command = "setlocal expandtab" })
	vim.api.nvim_create_autocmd({ "FileType" }, { pattern = filetype, command = "setlocal tabstop=" .. tab_size })
	vim.api.nvim_create_autocmd({ "FileType" }, { pattern = filetype, command = "setlocal shiftwidth=" .. tab_size })
	vim.api.nvim_create_autocmd({ "FileType" }, { pattern = filetype, command = "setlocal softtabstop=" .. tab_size })
end

spacify_filetype("php", 4)
spacify_filetype("javascript", 2)
spacify_filetype("typescript", 2)
spacify_filetype("json", 2)
spacify_filetype("html", 2)
