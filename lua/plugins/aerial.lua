return {
	"stevearc/aerial.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{
			"<leader>a",
			"<cmd>AerialToggle!<cr>",
			silent = true,
		},
	},
	opts = {
		on_attach = function(bufnr)
			local opt = { buffer = bufnr }
			vim.keymap.set("n", "{", require("aerial").prev, opt)
			vim.keymap.set("n", "}", require("aerial").next, opt)
		end,
		
		layout = {
		-- Enum: prefer_right, prefer_left, right, left, float
		default_direction = "prefer_left",
		-- When the symbols change, resize the aerial window (within min/max constraints) to fit
		},
	},
}
