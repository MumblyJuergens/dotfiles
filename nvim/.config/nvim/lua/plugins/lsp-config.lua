return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "clangd", "cmake" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- local lspconfig = require("lspconfig")
			-- vim.lsp.config('lua_ls', {
			--     capabilities = capabilities,
			-- })
			-- vim.lsp.config('clangd', {
			--     capabilities = capabilities,
			-- })
			-- vim.lsp.config('cmake', {
			--     capabilities = capabilities,
			-- })
			-- lspconfig.clangd.setup({
			--     capabilities = capabilities,
			-- })
			-- lspconfig.cmake.setup({
			--     capabilities = capabilities,
			-- })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show LSP hover" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions 🦸" })
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })

			-- neovim-tasks suggested this.
			--     vim.lsp.config("clangd", {
			--         cmd = require("tasks.cmake_utils.cmake_utils").currentClangdArgs(),
			--     })
		end,
	},
}
