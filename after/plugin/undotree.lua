vim.g.undotree_DiffCommand = "FC"
vim.opt.backup = false vim.opt.swapfile = false vim.opt.undodir = os.getenv('HOMEPATH') .. '/.nvim/plugin' vim.opt.undofile = true
vim.keymap.set('n', '<leader><F5>', vim.cmd.UndotreeToggle)
