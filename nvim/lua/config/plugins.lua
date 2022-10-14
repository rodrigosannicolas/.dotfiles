return require('packer').startup(function(use)
  -- Packer can manage itself
	use 'wbthomason/packer.nvim'

  -- Colorscheme
	use 'ayu-theme/ayu-vim'

	-- File explorer
	use { 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons' } }

	-- Parser generator tool
  use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

	-- Fuzzy finder
	use { 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { {'nvim-lua/plenary.nvim'} } }
end)
