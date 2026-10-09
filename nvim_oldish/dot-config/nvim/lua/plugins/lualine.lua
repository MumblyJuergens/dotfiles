local function cmakeStatus()
    local cmake = require("cmake-tools")
    if not cmake.is_cmake_project() then
        return ""
    end
    return "[ CMake | Kit: " .. cmake.get_kit() .. " | Target: " .. cmake.get_build_target() .. " | Type: " .. cmake.get_build_type() .. " ]"
end

return {
    "https://github.com/nvim-lualine/lualine.nvim",
    opts = {
        options = {
            theme = "catppuccin-nvim",
        },
        sections = {
            lualine_c = { { "filename", path = 1 } },
            lualine_x = { "encoding", "fileformat", "filetype", cmakeStatus },
            -- lualine_x = { "encoding", "fileformat", "filetype" },
        },
    }
}

