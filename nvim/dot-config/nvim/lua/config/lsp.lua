-- Thanks to https://codingbrush.com/configure-neovim-setting-up-a-lsp/
-- for the below!

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(event)
        local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, {
                buffer = event.buf,
                desc = "LSP: " .. desc,
            })
        end
        map("gd", vim.lsp.buf.definition, "Go to Definition")
        map("gi", vim.lsp.buf.implementation, "Go to Implementation")
        map("K", vim.lsp.buf.hover, "Hover Documentation")
--        map("<leader>ca", vim.lsp.buf.code_action, "Code Actions 🦸")
        map("<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
        map("<leader>fm", function()
            vim.lsp.buf.format({async = true})
        end, "Format Buffer")
        map("<leader>ld", "<cmd>Fzf diagnostics_document<cr>", "Diagnostics - Document")
        map("<leader>lw", "<cmd>Fzf diagnostics_workspace<cr>", "Diagnostics - Workspace")
    end
})

vim.lsp.config("lua_ls", {
    settings = {
    Lua = {
        diagnostics = {
            -- Tell lua_ls that "vim" is a known global
            globals = { "vim" },
        },
        workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
        },
        telemetry = {
            enable = false,
        },
    },
    },
})

