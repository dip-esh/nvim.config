local set = vim.opt

vim.g.mapleader = ","
set.number = true
vim.api.nvim_set_option("clipboard", "unnamed")
set.relativenumber = true
set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 0
set.expandtab = true
set.swapfile = false
set.cursorline = true
set.completeopt = { "menu", "menuone", "noselect" }
set.termguicolors = true
set.pastetoggle = "<F2>"
-- set.mouse = ''
--lua
vim.g.rooter_patterns = { ".git", "Makefile", "*.sln", "build/env.sh", "Dockerfile", "requirements.txt", "Cargo.toml" }

vim.g.NERDTreeWinPos = "right"
