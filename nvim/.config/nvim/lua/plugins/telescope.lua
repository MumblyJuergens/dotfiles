return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            "nvim-lua/plenary.nvim",

            -- I'm well aware the dependencies chain is backwards, it's... a workaround to make the setup function work.
            "nvim-telescope/telescope-ui-select.nvim",
            "nvim-telescope/telescope-bibtex.nvim",
        },
        config = function()
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
            vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, { desc = "Old files" })
            vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Grep word under cursor" })
            
            vim.keymap.set("n", "<leader>bt", ":Telescope bibtex<CR>", { desc = "BibTeX References" })

            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({
                            -- even more opts
                        }),

                        -- pseudo code / specification for writing custom displays, like the one
                        -- for "codeactions"
                        -- specific_opts = {
                        --   [kind] = {
                        --     make_indexed = function(items) -> indexed_items, width,
                        --     make_displayer = function(widths) -> displayer
                        --     make_display = function(displayer) -> function(e)
                        --     make_ordinal = function(e) -> string
                        --   },
                        --   -- for example to disable the custom builtin "codeactions" display
                        --      do the following
                        --   codeactions = false,
                        -- }
                    },
                    bibtex = {
                        -- Depth for the *.bib file
                        depth = 1,
                        -- Custom format for citation label
                        custom_formats = {
                            { id = "zettling", cite_marker = "[#%s]" },
                        },
                        -- Format to use for citation label.
                        -- Try to match the filetype by default, or use 'plain'
                        format = "zettling",
                        -- Path to global bibliographies (placed outside of the project)
                        global_files = {},
                        -- Define the search keys to use in the picker
                        search_keys = { "author", "year", "title" },
                        -- Template for the formatted citation
                        citation_format = "[#{{label}}] {{author}} ({{year}}), {{title}}",
                        -- Only use initials for the authors first name
                        citation_trim_firstname = true,
                        -- Max number of authors to write in the formatted citation
                        -- following authors will be replaced by "et al."
                        citation_max_auth = 2,
                        -- Context awareness disabled by default
                        context = false,
                        -- Fallback to global/directory .bib files if context not found
                        -- This setting has no effect if context = false
                        context_fallback = true,
                        -- Wrapping in the preview window is disabled by default
                        wrap = false,
                        -- user defined mappings
                        -- mappings = {
                        --     i = {
                        --         ["<CR>"] = bibtex_actions.key_append("%s"), -- format is determined by filetype if the user has not set it explictly
                        --         ["<C-e>"] = bibtex_actions.entry_append,
                        --         ["<C-c>"] = bibtex_actions.citation_append("{{author}} ({{year}}), {{title}}."),
                        --     },
                        -- },
                    },
                },
            })
            require("telescope").load_extension("ui-select")
            require("telescope").load_extension("bibtex")
        end,
    },
}
