## Requirements

- PowerShell Core (Windows)
- MinGw installed
- Node.js installed

## Basic Installation

1. Install Neovim: [https://github.com/neovim/neovim/blob/master/INSTALL.md](https://github.com/neovim/neovim/blob/master/INSTALL.md)
2. Install Git: [https://git-scm.com/downloads/win](https://git-scm.com/downloads/win)
3. Add Git to the environment pat
4. Install Packer by running:
    
    ```
    git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
    ```
    
5. Open `lua/config/packer.lua` in Neovim
6. Run Neovim, then execute the `:PackerSync` command

## Opening files with context menu
On Windows you can run `vimContext.reg` - to add option to run vim to your context menu (that one that pop-ups when u click RMB on (actually when u click in too) folder, file etc. 

## Setting a Patched Font

To avoid errors and strange characters in the terminal, it’s recommended to use a patched font (and it's even required - if you want the bottom bar to display correctly).

To do this, follow these steps:

1. Download a patched font (for example, I use FiraCode: [https://www.nerdfonts.com/font-downloads](https://www.nerdfonts.com/font-downloads))
2. Install choosen font on your computer
3. Launch `nvim`
4. In your terminal's settings, change the font to the one from the FiraCode package

This will ensure, that icons in the bottom bar display correctly.

## Shortcuts

### Remaps

- `[space]pv` — shows the directory tree
- `J/K` — in visual mode, moves the highlighted text up/down
- `J/j` — moves the line below to the current line; `J` does not move the cursor to the next line
- `[Ctrl] + u/d` — scrolls half a page up/down while keeping the cursor in place
- `n/N` — after a search (`/[search term]`), jumps through results up/down while keeping the cursor centered
- `[space]p` — pastes text into a selection without replacing the clipboard contents
- `[space]y/Y` — copies to the system clipboard
- `[space]d` — deletes without copying to the clipboard
- `[Ctrl]f` — switches the current project
- `[Ctrl]aL` — returns to the previous project
- `[space]s` — replaces the word currently under the cursor
- `[space]x` — makes the file executable (useful for bash scripts)

### LSP (Language Server Protocol)

- `K` — displays the definition of the function under the cursor
- `[F2]` — renames all occurrences of the variable under the cursor
- `[F3]` — formats the buffer using the language server
- `[F4]` — triggers code actions at the current cursor position
- `[Enter]` — confirms the suggested phrase

### Telescope

- `[space]pf` — launches the Telescope plugin
- `[space]ps` — searches files for a specified word (requires `ripgrep` to be installed)
- `[Ctrl] + p` — shows the Git-tracked directory

### Harpoon

- `[Ctrl]e` — opens the main menu
- `[space]e` — opens the mark menu
- `[Ctrl] + a` — adds the current file to the menu
- `[Ctrl] + h/t/n/s` — switches between saved files
- `[Ctrl] + m/n` — navigates to the next/previous file in the queue

### UndoTree

- `[space]u` — displays the undo tree
