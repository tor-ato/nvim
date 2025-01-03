return 
{
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("hlchunk").setup({
            chunk = {
                enable = true,
                duration = 10,
                delay = 10,
            },
            line_num = {
                enable = false,
            },
        })
    end
}
