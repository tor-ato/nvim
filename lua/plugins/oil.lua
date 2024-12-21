return 
{
	'stevearc/oil.nvim',
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	opts = {
		columns = {
			"icon",
			"permissions",
			"size",
			"mtime",
		}, 
	},
	keys = {
		{
			"-",
			function()
				require("oil").open()
			end,
			silent = true,
		},
	},
}
