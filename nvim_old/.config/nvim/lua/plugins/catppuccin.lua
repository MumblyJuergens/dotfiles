return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        vim.cmd.colorscheme("catppuccin")
        vim.cmd("hi Normal ctermbg=NONE guibg=NONE")
        vim.cmd("hi NonText ctermbg=NONE guibg=NONE")
    end,
}
