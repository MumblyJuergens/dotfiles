return {
  "nvim-neotest/neotest",
  dependencies = {
    "orjangj/neotest-ctest",
  },
  opts = function(_, opts)
    table.insert(
      opts.adapters,
      require("neotest-ctest").setup({
        dap_adapter = "codelldb",
      })
    )
  end,
}
