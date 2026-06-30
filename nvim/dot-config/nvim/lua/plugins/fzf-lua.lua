-- Think of it as a telescope alternative.

return {
    "ibhagwan/fzf-lua",
    lazy = false,
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "nvim-mini/mini.icons" },
    ---@module "fzf-lua"
    ---@type fzf-lua.Config|{}
    ---@diagnostic disable: missing-fields
    opts = {},
    ---@diagnostic enable: missing-fields
    keys = {
        {"<leader>ca", [[<cmd>FzfLua lsp_code_actions<cr>]], desc = "Code Actions"},
        {"<leader>dl", [[<cmd>FzfLua lsp_workspace_diagnostics<cr>]], desc = "Diagnostics List (Workspace)"},
        {"<leader>gr", [[<cmd>FzfLua lsp_references<cr>]], desc = "References List"},
        {"<leader><leader>", [[<cmd>FzfLua history<cr>]], desc = "Old Files"},
        {"<leader>ff", [[<cmd>FzfLua grep_project<cr>]], desc = "Grep"},
        {"<leader>fd", [[<cmd>FzfLua lsp_document_symbols<cr>]], desc = "Document Symbols"},
        {"<leader>fw", [[<cmd>FzfLua lsp_workspace_symbols<cr>]], desc = "Workspace Symbols"},
    },
}
