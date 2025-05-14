return {
	"nvim-telescope/telescope-frecency.nvim",
    keys = {
        {
            "<leader>fr",
            function()
                require("telescope").extensions.frecency.frecency(
                    require("telescope.themes").get_dropdown({ prompt_title = "Frequently Used" })
                )
            end,
            silent = true,
            desc = "frecency search",
        },
    },
    dependencies = {
		"nvim-telescope/telescope.nvim",
    },
    config = function(_, _)
        require("telescope").load_extension("frecency")
    end,
}
