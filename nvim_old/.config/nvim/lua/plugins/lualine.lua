return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        -- Tie in with neovim-tasks for cmake stats
        -- local Path = require("plenary.path")
        local lualine = require("lualine")

        -- local ProjectConfig = require("tasks.project_config")
        -- local function cmakeStatus()
        -- 	local cmake_config = ProjectConfig:new()["cmake"]
        -- 	local cmakelists_dir = cmake_config.source_dir and cmake_config.source_dir or vim.loop.cwd()
        -- 	if (Path:new(cmakelists_dir) / "CMakeLists.txt"):exists() then
        -- 		local cmake_utils = require("tasks.cmake_utils.cmake_utils")
        --
        -- 		if cmake_utils.shouldUsePresets(cmake_config) then
        -- 			local preset = cmake_config.build_preset or "not selected"
        -- 			local cmakeTarget = cmake_config.target and cmake_config.target or "all"
        --
        -- 			return "CMake preset: " .. preset .. ", target: " .. cmakeTarget
        -- 		else
        -- 			local cmakeBuildType = cmake_config.build_type or "not selected"
        -- 			local cmakeKit = cmake_config.build_kit or "not selected"
        -- 			local cmakeTarget = cmake_config.target or "all"
        --
        -- 			return "CMake variant: " .. cmakeBuildType .. ", kit: " .. cmakeKit .. ", target: " .. cmakeTarget
        -- 		end
        -- 	else
        -- 		return ""
        -- 	end
        -- end
        --#region
        --

        local function cmakeStatus()
            local cmake = require("cmake-tools")
            if not cmake.is_cmake_project() then
                return ""
            end
            return "[ CMake | Kit: " .. cmake.get_kit() .. " | Target: " .. cmake.get_build_target() .. " | Type: " .. cmake.get_build_type() .. " ]"
        end

        lualine.setup({
            options = {
                theme = "catppuccin",
            },
            sections = {
                lualine_c = { { "filename", path = 1 } },
                lualine_x = { "encoding", "fileformat", "filetype", cmakeStatus },
                -- lualine_x = { "encoding", "fileformat", "filetype" },
            },
        })
    end,
}
