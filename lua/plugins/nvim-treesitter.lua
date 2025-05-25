return {
  "nvim-treesitter/nvim-treesitter",
  event = {
    "BufNewFile  *.sh,*.c,*.h,*.cpp,*.hpp,*Dockerfile,*.gitignore,*.go,*.html,*.js,*.json,*.tex,*.lua,*Makefile,*makefile,*.md,*.nix,*.py,*.rs,*.toml,*.tml,*.ts,*.typ,*.vim,*.txt,*.yaml,*.yml",
    "BufReadPost *.sh,*.c,*.h,*.cpp,*.hpp,*Dockerfile,*.gitignore,*.go,*.html,*.js,*.json,*.tex,*.lua,*Makefile,*makefile,*.md,*.nix,*.py,*.rs,*.toml,*.tml,*.ts,*.typ,*.vim,*.txt,*.yaml,*.yml",
  },
  config = function(_, _)
    vim.opt.runtimepath:prepend "@treesitter_parser@"
    require("nvim-treesitter.configs").setup {
      auto_install = false,
      sync_install = false,
      ignore_install = { "all" },
      ensure_installed = { "cpp", "c", "lua" },
      modules = { "cpp", "c", "lua" },
      highlight = { enable = true },
      indent = { enable = true },
    }
  end,
}
