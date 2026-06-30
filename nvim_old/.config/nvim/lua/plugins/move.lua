return {
    "fedepujol/move.nvim",
    config = function()
        require("move").setup({})
        local opts = { noremap = true, silent = true }

        -- Normal-mode commands
        vim.keymap.set("n", "<A-down>", ":MoveLine(1)<CR>", opts, { desc = "Move line down" })
        vim.keymap.set("n", "<A-up>", ":MoveLine(-1)<CR>", opts, { desc = "Move line up" })
        --vim.keymap.set("n", "<A-h>", ":MoveHChar(-1)<CR>", opts)
        --vim.keymap.set("n", "<A-l>", ":MoveHChar(1)<CR>", opts)
        --vim.keymap.set("n", "<leader>wf", ":MoveWord(1)<CR>", opts)
        --vim.keymap.set("n", "<leader>wb", ":MoveWord(-1)<CR>", opts)

        -- Visual-mode commands
        vim.keymap.set("v", "<A-down>", ":MoveBlock(1)<CR>", opts, { desc = "Move block down" })
        vim.keymap.set("v", "<A-up>", ":MoveBlock(-1)<CR>", opts, { desc = "Move block up" })
        --vim.keymap.set("v", "<A-h>", ":MoveHBlock(-1)<CR>", opts)
        --vim.keymap.set("v", "<A-l>", ":MoveHBlock(1)<CR>", opts)
    end,
}
