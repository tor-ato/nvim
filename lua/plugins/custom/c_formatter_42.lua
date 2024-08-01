-- ~/.config/nvim/lua/custom/c_formatter_42.lua

local M = {}

M.setup = function()
  vim.g.c_formatter_42_exec = vim.g.c_formatter_42_exec or "c_formatter_42"
  vim.g.c_formatter_42_set_equalprg = vim.g.c_formatter_42_set_equalprg or 0
  vim.g.c_formatter_42_format_on_save = vim.g.c_formatter_42_format_on_save or 0

  -- Remove the installation check and pip install command

  local function c_formatter_42()
    vim.cmd("normal! mq")
    local equalprg_tmp = vim.o.equalprg
    vim.o.equalprg = vim.g.c_formatter_42_exec
    vim.cmd("silent normal! gg=G")
    vim.o.equalprg = equalprg_tmp
    vim.cmd("normal! `q")
    vim.cmd("normal! zz")
  end

  if vim.g.c_formatter_42_set_equalprg == 1 then
    vim.opt_local.equalprg = vim.g.c_formatter_42_exec
  end

  if vim.g.c_formatter_42_format_on_save == 1 then
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = { "*.c", "*.h" },
      callback = c_formatter_42
    })
  end

  vim.api.nvim_create_user_command("CFormatter42", c_formatter_42, {})
  vim.keymap.set("n", "<F2>", ":CFormatter42<CR>", { noremap = true, silent = true })
end

return M
