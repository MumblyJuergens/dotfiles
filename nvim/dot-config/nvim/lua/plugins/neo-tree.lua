return {
    "nvim-neo-tree/neo-tree.nvim",

    dependencies = { "MunifTanjim/nui.nvim" }, -- UI Component Library for Neovim.
    keys = {
        {"<leader>n", ":Neotree filesystem toggle left<CR>", desc = "Show neotree on left" },
        {"<leader>bv", ":Neotree buffers toggle right<CR>", desc = "Show buffers on right" },
    },
    opts = {
        sort_function = function (a,b)
            return a.path < b.path
        end
    },
    lazy = false,
}
