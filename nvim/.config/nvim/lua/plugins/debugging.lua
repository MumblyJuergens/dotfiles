local dapOpenState = false

return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")
        dapui.setup()
        local widgets = require("dap.ui.widgets")

        dap.listeners.before.attach.dapui_config = dapui.open
        dap.listeners.before.launch.dapui_config = dapui.open
        dap.listeners.before.event_terminated.dapui_config = dapui.close
        dap.listeners.before.event_exited.dapui_config = dapui.close

        vim.keymap.set("n", "<leader>dv", function()
            if dapOpenState then
                dapui.open()
            else
                dapui.close()
            end
            dapOpenState = not dapOpenState
        end, { desc = "Toggle DAP visible" })

        vim.keymap.set("n", "<F5>", dap.continue, { desc = "DAP continue" })
        vim.keymap.set("n", "<F10>", dap.step_over, { desc = "DAP Step over" })
        vim.keymap.set("n", "<F11>", dap.step_into, { desc = "DAP Step into" })
        vim.keymap.set("n", "<F12>", dap.step_out, { desc = "DAP Step out" })
        vim.keymap.set("n", "<Leader>B", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
        vim.keymap.set("n", "<Leader>lp", function()
            dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
        end, { desc = "DAP Set log point message" })
        vim.keymap.set("n", "<Leader>dr", dap.repl.open, { desc = "DAP Open REPL" })
        vim.keymap.set("n", "<Leader>dl", dap.run_last, { desc = "DAP Run last" })
        vim.keymap.set({ "n", "v" }, "<Leader>dh", widgets.hover, { desc = "DAP hover" })
        vim.keymap.set({ "n", "v" }, "<Leader>dp", widgets.preview, { desc = "DAP preview" })
        vim.keymap.set("n", "<Leader>df", function()
            widgets.centered_float(widgets.frames)
        end, { desc = "DAP show frames" })
        vim.keymap.set("n", "<Leader>ds", function()
            widgets.centered_float(widgets.scopes)
        end, { desc = "DAP show scopes" })

        dap.adapters.cppdbg = {
            id = "cppdbg",
            type = "executable",
            command = "OpenDebugAD7",
            options = {
                detached = false,
            },
        }

        dap.adapters.codelldb = {
            type = "executable",
            command = "codelldb",
            options = {
                detached = false,
            },
        }

        dap.configurations.cpp = {
            {
                name = "Launch file (cppdbg)",
                type = "cppdbg",
                request = "launch",
                program = function()
                    local cfg = read_nvcfg()
                    if cfg then
                        print("Running " .. cfg.cppdb.executable)
                        return cfg.cppdb.executable
                    else
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end
                end,
                cws = function()
                    local cfg = read_nvcfg()
                    if cfg then
                        print("In " .. cfg.cppdb.cwd)
                        return cfg.cppdb.cwd
                    else
                        return vim.fn.input("Working directory: ", vim.fn.getcwd() .. "/", "file")
                    end
                end,
                cwd = "${workspaceFolder}",
                stopAtEntry = true,
            },
            {
                name = "Launch file (codelldb)",
                type = "codelldb",
                request = "launch",
                program = function()
                    local cfg = read_nvcfg()
                    if cfg then
                        print("Running " .. cfg.codelldb.executable)
                        return cfg.codelldb.executable
                    else
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end
                end,
                cwd = function()
                    local cfg = read_nvcfg()
                    if cfg then
                        print("In " .. cfg.codelldb.cwd)
                        return cfg.codelldb.cwd
                    else
                        return vim.fn.input("Working Directory: ", vim.fn.getcwd() .. "/", "file")
                    end
                end,
                stopOnEntry = false,
            },
        }
    end,
}
