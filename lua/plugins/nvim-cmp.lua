return
{
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		{ "f3fora/cmp-spell" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-cmdline" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-nvim-lsp-signature-help" },
		{ "zbirenbaum/copilot-cmp" },
	},
	config = function()
		local cmp = require("cmp")
		cmp.setup({
			completion = {
				completeopt = "menu,menuone,noinsert,noselect",
			},
			mapping = cmp.mapping.preset.insert({
				["<CR>"] = cmp.mapping.confirm({
				  behavior = cmp.ConfirmBehavior.Replace,
				  select = true,
				}),
			}),
			sources = cmp.config.sources({
				{ name = "copilot" },
				{ name = "spell" },
				{ name = "buffer" },
				{ name = "nvim_lsp" },
				{ name = "path" },
				{ name = "nvim_lsp_signature_help" },
			}),
		})
   end,
}
