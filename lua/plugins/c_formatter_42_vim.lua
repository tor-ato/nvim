return {
  {
    "cacharle/c_formatter_42.vim",
    enabled = false  -- Disable the original plugin
  },
  {
    dir = "~/.config/nvim/lua/custom",
    name = "custom-c-formatter-42",
    ft = { "c", "cpp" },
    config = function()
      require("custom.c_formatter_42").setup()
    end
  }
}
