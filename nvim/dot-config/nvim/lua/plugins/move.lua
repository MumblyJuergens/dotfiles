-- Gain the power to move lines and blocks!
return {
    "fedepujol/move.nvim",
    config = function()
        require("move").setup({})
        local opts = { noremap = true, silent = true }

        -- Normal-mode commands
        vim.keymap.set("n", "<A-down>", ":MoveLine(1)<CR>", opts, { desc = "Move line down" })
        vim.keymap.set("n", "<A-up>", ":MoveLine(-1)<CR>", opts, { desc = "Move line up" })

        -- Visual-mode commands
        vim.keymap.set("v", "<A-down>", ":MoveBlock(1)<CR>", opts, { desc = "Move block down" })
        vim.keymap.set("v", "<A-up>", ":MoveBlock(-1)<CR>", opts, { desc = "Move block up" })
    end,
}
