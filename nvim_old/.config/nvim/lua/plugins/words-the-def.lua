return {
    "Praczet/words-the-def.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("words-the-def").setup({})
    end
}
