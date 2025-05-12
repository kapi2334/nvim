function ColorMyPencils(color)
	color = color or "gruvbox-material" --defaults
	vim.cmd.colorscheme(color)--setting given color

	vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})
vim.o.cursorline = false
    

--	print("Color schemes applied successfully.")
end
ColorMyPencils()

