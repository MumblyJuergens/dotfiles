-- Performant, batteries-included completion plugin for Neovim


return {
  "saghen/blink.cmp",
  version = "1.*",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  ---@module "blink.cmp"
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = "none",
      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-e>"]     = { "hide" },
      ["<C-y>"]     = { "select_and_accept" },
      ["<CR>"]      = { "select_and_accept", "fallback" },
      ["<up>"]     = { "select_prev", "fallback" },
      ["<down>"]     = { "select_next", "fallback" },
      ["<C-b>"]     = { "scroll_documentation_up", "fallback" },
      ["<C-f>"]     = { "scroll_documentation_down", "fallback" },
      ["<Tab>"]     = { "snippet_forward", "fallback" },
      ["<S-Tab>"]   = { "snippet_backward", "fallback" },
    },

    appearance = {
      nerd_font_variant = "mono",
    },

    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
      ghost_text = {
        enabled = true,
      },
      accept = {
        auto_brackets = {
          enabled = true,
        },
      },
      menu = {
        draw = {
          treesitter = { "lsp" },
        },
      },
    },

    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },

    signature = {
      enabled = true,
    },

    fuzzy = {
      -- prefer the Rust implementation if available; falls back to Lua
      implementation = "prefer_rust_with_warning",
    },
  },
}

