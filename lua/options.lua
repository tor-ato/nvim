-- language to en_US
vim.cmd('language en_US.UTF-8')

-- enable line numbers
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

-- save undo histroy
vim.opt.undofile = true

-- search
vim.opt.hlsearch = true
vim.opt.ignorecase = true

-- indent shift width
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- enable transparency for a floating window and a popup window
vim.opt.winblend = 20
vim.opt.pumblend = 20

-- others
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 10
vim.opt.shell = "zsh"
vim.opt.termguicolors = true
vim.opt.fileencoding = "utf-8"
vim.opt.langmenu = 'en_US'
vim.env.LANG = 'en_US'
vim.opt.modifiable = true

-- swapfile
vim.opt.swapfile = false

-- split right
vim.opt.splitright = true
