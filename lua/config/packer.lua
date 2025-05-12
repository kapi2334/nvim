-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
	  'sainnhe/gruvbox-material',
	  lazy = false,
	  priority = 1000,
	  config = function()
		  -- Optionally configure and load the colorscheme
		  -- directly inside the plugin declaration.
		  vim.g.gruvbox_material_enable_italic = true
		  vim.cmd.colorscheme('gruvbox-material')
	  end

  }
  use(
	  'nvim-treesitter/nvim-treesitter', {run = 'TSUpdate'}
  )
  use('nvim-treesitter/playground')
  
  use('theprimeagen/harpoon')
  use('mbbill/undotree')

  use('lukas-reineke/indent-blankline.nvim')
  use('famiu/feline.nvim')

  use({
      "L3MON4D3/LuaSnip",
       })

  --lsp settings 
  --

  use('neovim/nvim-lspconfig')
  use('hrsh7th/nvim-cmp')
  use('hrsh7th/cmp-nvim-lsp')

  --mason install

  use('mason-org/mason.nvim')
  use('mason-org/mason-lspconfig.nvim')
  use('onsails/lspkind.nvim')

    end)  


