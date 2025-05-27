return {
	"neovim/nvim-lspconfig",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"mfussenegger/nvim-lint",
		{
			"hrsh7th/cmp-nvim-lsp",
			dependencies = {
				"nvimdev/lspsaga.nvim",
				"folke/neodev.nvim",
			},
		},
		{
			"nvimdev/lspsaga.nvim",
			config = function()
				require("lspsaga").setup {
					symbol_in_winbar = {
						enable = false,
					},
					ui = {
						code_action = "",
					},
				}
			end,
		},
		{
			"folke/neodev.nvim",
			ft = "lua",
		},
	},
	opts = {
		autoformat = false,
		servers = {
			clangd = {
				cmd = {
					"clangd",
					"--fallback-style=webkit",
					"--background-index",
					"--clang-tidy",
					"--query-driver=/usr/bin/gcc",
					"--all-scopes-completion",
					"--completion-style=detailed",
					"--offset-encoding=utf-16",
				},
				init_options = {
					fallbackFlags = {
						"--std=c++98",
						"--Wall",
						"--Wextra",
						"--Werror",
						"--driver-mode=g++",
					},
				},
			},
		},
	},

	config = function(_, opts)
		-- 診断表示の強化設定
		vim.diagnostic.config {
			virtual_text = {
				prefix = "",
				spacing = 0,
			},
			signs = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
		}

		-- キーマップ設定
		local keymap_opt = { noremap = true, silent = true }
		vim.keymap.set("n", "K", vim.lsp.buf.hover, keymap_opt)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, keymap_opt)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, keymap_opt)
		vim.keymap.set("n", "gn", vim.lsp.buf.rename, keymap_opt)

		-- リファレンスハイライト設定
		vim.api.nvim_create_augroup("lsp_document_highlight", {})
		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			pattern = { "*.c", "*.cpp", "*.py", "*.rs", "*.lua", "Makefile" },
			group = "lsp_document_highlight",
			callback = vim.lsp.buf.document_highlight,
		})
		vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
			pattern = { "*.c", "*.cpp", "*.py", "*.rs", "*.lua", "Makefile" },
			group = "lsp_document_highlight",
			callback = vim.lsp.buf.clear_references,
		})
		vim.opt.updatetime = 500

		-- ハイライトカラー設定
		vim.api.nvim_set_hl(0, "LspReferenceText", { bg = "#4a4a4a", underline = true })
		vim.api.nvim_set_hl(0, "LspReferenceRead", { bg = "#4a4a4a", underline = true })
		vim.api.nvim_set_hl(0, "LspReferenceWrite", { bg = "#4a4a4a", underline = true })

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		require("mason-lspconfig").setup({
			ensure_installed = {}, -- 自動インストールしたいLSPサーバー名を配列で指定
			automatic_enable = false,
			handlers = {
				function(server)
					local server_opts = vim.tbl_deep_extend("force", {
						capabilities = capabilities,
					}, opts.servers[server] or {})
					require("lspconfig")[server].setup(server_opts)
				end,
			}
		})
	end,
}
