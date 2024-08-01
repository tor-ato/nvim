return {
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    dependencies = {
      {
        "nvimdev/lspsaga.nvim",
        config = function()
          require("lspsaga").setup {
            symbol_in_winbar = {
              enable = false,
            },
            ui = {
              code_action = "",
            },
          }
        end,
      },
      {
        "folke/neodev.nvim",
        ft = "lua",
      },
    },
    cond = function()
      -- ignore filetype markdown
      return vim.bo.filetype ~= "markdown"
    end,
  },
}
