vim.cmd([[
    set tabstop=4
    set expandtab
    set softtabstop=4
    set shiftwidth=4
    set nowrap
    set exrc
    set number
    set foldmethod=syntax
    "set foldcolumn=auto
]])

vim.api.nvim_create_autocmd({"BufWinLeave"}, {
  pattern = {"?*"},
  desc = "save view (folds), when closing file",
  command = "mkview",
})
vim.api.nvim_create_autocmd({"BufWinEnter"}, {
  pattern = {"?*"},
  desc = "load view (folds), when opening file",
  command = "silent! loadview"
})

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})
