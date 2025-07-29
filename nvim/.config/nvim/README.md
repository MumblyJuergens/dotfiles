# Install notes

`git` is required.

After install, use Mason to install:
    * Formatters
        * stylua (Lua)
        * black (Python)
        * isort (Python)
    * DAB
        * codelldb
        * cpptools

## Windows

```
winget install Neovim.Neovim
winget install sharkdp.fd
winget install BurntSushi.ripgrep.MSVC
```

Also install:
    * Lua
    * 7zip (req of mason)

## Hokeys

# Normal Mode

K           - Hover action.
gd          - Go to definition.
<leader>ca  - Code Action.
Ctrl-n      - Show Neotree on left.
Ctrl-p      - Find files.
<leader>fg  - Fuzzy grep.
<leader>gf  - Format document.
