local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opt = {
  defaults = { lazy = true },
  performance = {
    rtp = {
      disabled_plugins = {
        "nvim-notify",
      },
    },
  },
  checker = {
    enabled = false,
    notify = false,
  },
  change_detection = {
    enabled = false,
    notify = false,
  },
}

require("lazy").setup("plugins", opt)
