return
{
	"kazhala/close-buffers.nvim",
	config = function()
		require('close_buffers').setup({})
	end,
	keys = {
		{ "<A-o>", function() require('close_buffers').delete({ type = 'other', force = true }) end, mode = "n", desc = "CloseBuffers Close other bueers" },
		{ "<A-c>", function() require('close_buffers').delete({ type = 'this' }) end,                 mode = "n", desc = "CloseBuffers Close the current buffer" },
		{ "<A-a>", function() require('close_buffers').delete({ type = 'all' }) end,                 mode = "n", desc = "CloseBuffers Close all" },
	},
}
