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
          "--log=error",
          "--background-index=false", -- 一時的に無効化
          "--header-insertion=never",
          "--completion-style=bundled",
          "--clang-tidy=true",
          "--malloc-trim",
          "--pch-storage=memory",
        },
        init_options = {
          clangdFileStatus = true,
          fallbackFlags = {
		  	"-std=gnu++98",  -- C++98を指定する場合はgnu++98を使用
            "-Wall",
            "-Wextra",
            "-Werror",
            "-fexceptions",
          },
        },
        filetypes = { "cpp", "cxx", "cc", "hpp", "hxx", "h" },
        root_dir = function(fname)
          return require("lspconfig.util").root_pattern(
            "Makefile",
            "compile_commands.json",
            "compile_flags.txt",
            ".git"
          )(fname) or require("lspconfig.util").dirname(fname)
        end,
        on_attach = function(client)
          -- セマンティックハイライトを無効化
          client.server_capabilities.semanticTokensProvider = nil
        end,
      },
    },
  },
  config = function(_, opts)
    -- LSPログレベルを設定
    vim.lsp.set_log_level("ERROR")
    -- 診断表示の設定
    vim.diagnostic.config {
      virtual_text = {
        prefix = "",
        spacing = 2,
        source = "if_many",
      },
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    }
    
    -- キーマップ設定
    local keymap_opt = { noremap = true, silent = true }
    vim.keymap.set("n", "K", vim.lsp.buf.hover, keymap_opt)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, keymap_opt)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, keymap_opt)
    vim.keymap.set("n", "gn", vim.lsp.buf.rename, keymap_opt)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, keymap_opt)
    
    -- LSPサーバー設定
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    
    -- セマンティックトークンを無効化（パフォーマンス向上）
    capabilities.textDocument.semanticTokens = nil
    
    require("mason-lspconfig").setup_handlers {
      function(server)
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = capabilities,
        }, opts.servers[server] or {})
        require("lspconfig")[server].setup(server_opts)
      end,
    }
  end,
}
