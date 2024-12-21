return
{
	"phaazon/hop.nvim",
	keys = {
		{
			"f",
			function()
				require("hop").hint_char1()
			end,
			silent = true,
			remap = true,
		},
	},
	opts = {},
}
