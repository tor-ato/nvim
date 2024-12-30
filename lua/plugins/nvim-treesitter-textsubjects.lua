return
{
    "RRethy/nvim-treesitter-textsubjects",
    event = "VeryLazy",
    requires = "nvim-treesitter/nvim-treesitter",
    after = "nvim-treesitter",
    config = function()
        local textobjects = {
            ["."] = "textsubjects-smart",
            [";"] = "textsubjects-container-outer",
            ["/"] = "textsubjects-container-inner",
        }

        require("nvim-treesitter.configs").setup({
            textsubjects = {
                enable = true,
                prev_selection = ",",
                keymaps = textobjects,
            },
        })

    end,
}
