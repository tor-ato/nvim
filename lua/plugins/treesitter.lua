-- ~/.config/nvim/lua/plugins/treesitter.lua

return
{
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "vim", "vimdoc", "query" },
      sync_install = false,
      auto_install = true,
      highlight = { enable = true },
      additional_vim_regex_highlighting = false,
    })
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
}
