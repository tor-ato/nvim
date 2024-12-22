return
{
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
		},
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                completion = {
                    completeopt = "menu,menuone,noinsert",
                },
					-- original settings
					--            mapping = {
					--                ["<C-Space>"] = cmp.mapping.complete(),
					--                ["<C-e>"] = cmp.mapping.close(),
					--                ["<CR>"] = cmp.mapping.confirm({ 
					-- 	behavior = cmp.ConfirmBehavior.Replace,
					-- 	select = true, 
					-- }),
					--            },
				 mapping = cmp.mapping.preset.insert({
					["<CR>"] = cmp.mapping.confirm({
					  behavior = cmp.ConfirmBehavior.Replace,
					  select = true,
					}),
					-- with this setting, it will complete and tab change the args but it's wired.
					-- ["<C-Space>"] = cmp.mapping.complete(),
				}),
					-- choose from dependencies sources
					sources = cmp.config.sources({
                    { name = "spell" },
                    { name = "buffer" },
                    { name = "nvim_lsp" },
                    { name = "path" },
                    { name = "nvim_lsp_signature_help" },
                }),
            })

            cmp.setup.cmdline("/", {
                completion = {
                    completeopt = "menu,menuone,noselect",
                },
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "nvim_lsp_document_symbol" },
                }, {
                    { name = "buffer" },
                }),
            })
            cmp.setup.cmdline(":", {
                completion = {
                    completeopt = "menu,menuone,noselect",
                },
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "path" },
                }, {
                    {
                        name = "cmdline",
                        option = {
                            ignore_cmds = {
                                "make",
                                "Make",
                                "grep",
                                "Grep",
                                "Man",
                                "!",
                            },
                        },
                    },
                }),
            })

            -- Set configuration for specific filetype.
            cmp.setup.filetype("gitcommit", {
                sources = cmp.config.sources({
                    { name = "spell" },
                }, {
                    { name = "buffer" },
                }),
            })
            cmp.setup.filetype("markdown", {
                sources = cmp.config.sources({
                    { name = "buffer" },
                }),
            })
        end,
    },

    {
        "garymjr/nvim-snippets",
        dependencies = {
            "rafamadriz/friendly-snippets",
        },
        config = function()
            require("snippets").setup({ friendly_snippets = true })
        end,
        keys = {
            {
                "<Tab>",
                function()
                    if vim.snippet.active({ direction = 1 }) then
                        vim.schedule(function()
                            vim.snippet.jump(1)
                        end)
                        return
                    end
                    return "<Tab>"
                end,
                expr = true,
                silent = true,
                mode = "i",
            },
            {
                "<Tab>",
                function()
                    vim.schedule(function()
                        vim.snippet.jump(1)
                    end)
                end,
                expr = true,
                silent = true,
                mode = "s",
            },
            {
                "<S-Tab>",
                function()
                    if vim.snippet.active({ direction = -1 }) then
                        vim.schedule(function()
                            vim.snippet.jump(-1)
                        end)
                        return
                    end
                    return "<S-Tab>"
                end,
                expr = true,
                silent = true,
                mode = { "i", "s" },
            },
        },
    }
}
