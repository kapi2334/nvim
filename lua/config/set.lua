--Basic vim configuration commands
vim.opt.guicursor = "" --fat cursor

--line numbers
vim.opt.nu = true
vim.opt.relativenumber = true 

--spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

--line wrap
vim.opt.wrap = false 

--search highlighting
vim.opt.hlsearch = false
vim.opt.incsearch = true

--good colors?
vim.opt.termguicolors = true

vim.opt.scrolloff = 10 -- zawsze mam 10 lini nad/pod soba w momencie scrollowania
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

--fast update time 
vim.opt.updatetime = 50

--space on right
vim.opt.colorcolumn = "150"

--leader definition
vim.g.mapleader = " "

