-- check https://github.com/romgrk/barbar.nvim
-- for more informations
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map("n", "<A-h>", ":BufferPrevious<CR>", opts)
map("n", "<A-l>", ":BufferNext<CR>", opts)
-- Re-order to previous/next
map("n", "<A-H>", ":BufferMovePrevious<CR>", opts)
map("n", "<A-L>", ":BufferMoveNext<CR>", opts)
-- Goto buffer in position...
map('n', '<A-1>', ':BufferGoto 1<CR>', opts)
map('n', '<A-2>', ':BufferGoto 2<CR>', opts)
map('n', '<A-3>', ':BufferGoto 3<CR>', opts)
map('n', '<A-4>', ':BufferGoto 4<CR>', opts)
map('n', '<A-5>', ':BufferGoto 5<CR>', opts)
map('n', '<A-6>', ':BufferGoto 6<CR>', opts)
map('n', '<A-7>', ':BufferGoto 7<CR>', opts)
map('n', '<A-8>', ':BufferGoto 8<CR>', opts)
map('n', '<A-9>', ':BufferGoto 9<CR>', opts)
map('n', '<A-0>', ':BufferLast<CR>', opts)
-- Pin/unpin buffer
map("n", "<A-p>", ":BufferPin<CR>", opts)

return 
{
	"romgrk/barbar.nvim",
	lazy = false,
	config = function()
		require("barbar").setup({
			-- Enable/disable animations
			animation = true,
			icons = {
				gitsigns = {
					added = { enabled = true, icon = "+" },
					changed = { enabled = true, icon = "~" },
					deleted = { enabled = true, icon = "-" },
				},
				filetype = {
					-- Sets the icon's highlight group.
					-- If false, will use nvim-web-devicons colors
					custom_colors = false,

					-- Requires `nvim-web-devicons` if `true`
					enabled = true,
				},
				separator = { left = " < ", right = "" },
				-- If true, add an additional separator at the end of the buffer list
				separator_at_end = true,
				-- Configure the icons on the bufferline when modified or pinned.
				-- Supports all the base icon options.
				modified = { button = "●" },
				pinned = { button = "", filename = true },
				-- Use a preconfigured buffer appearance— can be 'default', 'powerline', or 'slanted'
				preset = "default",
			},
		})
	end,
}
