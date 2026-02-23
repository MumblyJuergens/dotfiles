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
nmap <F6> :w<cr>
imap <F6> <esc>:w<cr>a
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

vim.cmd([[
highlight NotifyERRORBorder guifg=#8A1F1F
highlight NotifyWARNBorder guifg=#79491D
highlight NotifyINFOBorder guifg=#4F6752
highlight NotifyDEBUGBorder guifg=#8B8B8B
highlight NotifyTRACEBorder guifg=#4F3552
highlight NotifyERRORIcon guifg=#F70067
highlight NotifyWARNIcon guifg=#F79000
highlight NotifyINFOIcon guifg=#A9FF68
highlight NotifyDEBUGIcon guifg=#8B8B8B
highlight NotifyTRACEIcon guifg=#D484FF
highlight NotifyERRORTitle  guifg=#F70067
highlight NotifyWARNTitle guifg=#F79000
highlight NotifyINFOTitle guifg=#A9FF68
highlight NotifyDEBUGTitle  guifg=#8B8B8B
highlight NotifyTRACETitle  guifg=#D484FF
highlight link NotifyERRORBody Normal
highlight link NotifyWARNBody Normal
highlight link NotifyINFOBody Normal
highlight link NotifyDEBUGBody Normal
highlight link NotifyTRACEBody Normal
]])
