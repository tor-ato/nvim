return {
    "neovim/nvim-lspconfig",
    event = {
        "BufReadPre",
        "BufNewFile",
    },
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
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
		config = function()
			 local capabilities = require("cmp_nvim_lsp").default_capabilities()
			 require("mason-lspconfig").setup({
		
				handlers = {
				  function(server)
					local opt = {
					  capabilities = capabilities,
					}
					require("lspconfig")[server].setup(opt)
				  end,
				}
			  })
			end
    },
    config = function()
        local opt = { noremap = true, silent = true }
        -- set buffer local keymap
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opt)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opt)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opt)
        vim.keymap.set("n", "gn", vim.lsp.buf.rename, opt)

        -- Google C++ Format on gf
        vim.keymap.set("n", "gf", function()
            vim.lsp.buf.formatting_sync(nil, 1000)
        end, opt)

        -- reference highlight
        vim.api.nvim_create_augroup("lsp_document_highlight", {})
        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            pattern = { "*.c", "*.cpp", "*.py", "*.rust", "*.lua", "Makefile" }, -- workaround
            group = "lsp_document_highlight",
            callback = function()
                vim.lsp.buf.document_highlight()
            end
        })
        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            pattern = { "*.c", "*.cpp", "*.py", "*.rust", "*.lua" }, -- workaround
            group = "lsp_document_highlight",
            callback = function()
                vim.lsp.buf.clear_references()
            end
        })
        -- TODO: understand the arguments (see help)
        vim.opt.updatetime = 500
        vim.api.nvim_set_hl(0, "LspReferenceText", {
            bg = "#4a4a4a",
            underline = true,
        })
        vim.api.nvim_set_hl(0, "LspReferenceRead", {
            bg = "#4a4a4a",
            underline = true,
        })
        vim.api.nvim_set_hl(0, "LspReferenceWrite", {
            bg = "#4a4a4a",
            underline = true,
        })
    end
}
