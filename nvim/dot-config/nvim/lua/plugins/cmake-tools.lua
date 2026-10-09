return {
  {
    "Civitasv/cmake-tools.nvim",
    keys = { { "<localleader>b", [[:CMakeBuild<CR>]], desc = "CMake Build" } },
    opts = {
      cmake_build_directory = function()
        return "build"
      end,
    },
  },
}
