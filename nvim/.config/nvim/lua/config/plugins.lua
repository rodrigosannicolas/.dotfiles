return require("packer").startup(function(use)
  -- Packer can manage itself
  use "wbthomason/packer.nvim"

  -- Colorscheme
  use "ayu-theme/ayu-vim"
  use "folke/tokyonight.nvim"

	-- File explorer
  use { "nvim-tree/nvim-tree.lua", requires = { "nvim-tree/nvim-web-devicons" } }

	-- Parser generator tool
  use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

	-- Fuzzy finder
  use { "nvim-telescope/telescope.nvim", tag = "0.1.0", requires = { { "nvim-lua/plenary.nvim" } } }

  -- Airline
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }

  -- Collection of configurations for built-in LSP client
  use 'neovim/nvim-lspconfig'

  -- Autocompletion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  
  -- Snippets
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp

  -- Git inline blame
  use { 'lewis6991/gitsigns.nvim' }
end)
