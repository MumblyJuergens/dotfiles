vim.cmd("set tabstop=4")
vim.cmd("set expandtab")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set nowrap")
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.cmd([[
set exrc
set number
]])
vim.keymap.set("n", "<leader>se", [[:set spell spelllang=en_au<cr>]], { silent = true, desc = "Spell check enable" })
vim.keymap.set("n", "<leader>sd", [[:set spell!<cr>]], { silent = true, desc = "Spell check disable" })

-- Remap window switching keys.
-- vim.cmd("nnoremap <A-h> <C-W>h")
-- vim.cmd("nnoremap <A-j> <C-W>j")
-- vim.cmd("nnoremap <A-k> <C-W>k")
-- vim.cmd("nnoremap <A-l> <C-W>l")

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})
