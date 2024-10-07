return {
    "RRethy/nvim-treesitter-textsubjects",
    event = "VeryLazy",
    requires = "nvim-treesitter/nvim-treesitter",
    after = "nvim-treesitter",
    config = function()
        local textobjects = {
			['.'] = 'textsubjects-smart',
            [';'] = 'textsubjects-container-outer',
            ['i;'] = 'textsubjects-container-inner',
            ['i;'] = { 'textsubjects-container-inner', desc = "Select inside containers (classes, functions, etc.)" },
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
