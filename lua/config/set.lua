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
vim.opt.colorcolumn = "258"

--leader definition
vim.g.mapleader = " "


--Status bar

function _G.HasPaste()
  return vim.o.paste and 'PASTE MODE  ' or ''
end


-- Ustaw kodowanie
vim.opt.encoding = 'utf-8'

-- Zawsze pokazuj status line
--vim.opt.laststatus = 2

-- Format status line
--vim.opt.statusline = [[%{v:lua.HasPaste()}%F%m%r%h%w                                                          CWD: %{getcwd()}  Line: %l  Column: %c]]

--font settting
if vim.fn.has("mac") == 1 or vim.fn.has("macunix") == 1 then
  vim.opt.guifont = "IBM Plex Mono:h14,Hack:h14,Source Code Pro:h15,Menlo:h15"
elseif vim.fn.has("win16") == 1 or vim.fn.has("win32") == 1 then
  vim.opt.guifont = "IBM Plex Mono:h14,Source Code Pro:h12,Bitstream Vera Sans Mono:h11"
elseif vim.fn.has("gui_gtk2") == 1 or vim.fn.has("linux") == 1 then
  vim.opt.guifont = "IBM Plex Mono 14,Hack 14,Source Code Pro 12,Bitstream Vera Sans Mono 11"
elseif vim.fn.has("unix") == 1 then
  vim.opt.guifont = "Monospace 11"
end

