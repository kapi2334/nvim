local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

require('telescope').load_extension('harpoon')

vim.keymap.set("n", "<C-a>", mark.add_file)

vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-j>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-k>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-l>", function() ui.nav_file(4) end)
vim.keymap.set("n", "<C-m>", require('harpoon.ui').nav_next) 
vim.keymap.set("n", "<C-n>", require('harpoon.ui').nav_prev)
vim.keymap.set('n', '<leader>e', ':Telescope harpoon marks<CR>', { noremap = true, silent = true })
