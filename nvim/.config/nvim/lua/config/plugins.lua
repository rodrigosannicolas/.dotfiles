return require("packer").startup(function(use)
  -- Packer can manage itself
  use "wbthomason/packer.nvim"

  -- Colorscheme
  use({ 'rose-pine/neovim', as = 'rose-pine' })
  use { "catppuccin/nvim", as = "catppuccin" }

	-- File explorer
  use { "nvim-tree/nvim-tree.lua", requires = { "nvim-tree/nvim-web-devicons" } }

	-- Parser generator tool
  use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

	-- Fuzzy finder
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { {'nvim-lua/plenary.nvim'} } }
  use { "nvim-telescope/telescope-file-browser.nvim" }

  -- Airline
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }

  -- Git inline blame
  use { 'lewis6991/gitsigns.nvim' }

  -- Linting
  use "dense-analysis/ale"

  -- Git wrapper
  use('tpope/vim-fugitive')

  -- Auto pairs
  use {	"windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end }

  -- Indent blank lines
  use "lukas-reineke/indent-blankline.nvim"

  -- Comment lines
  use "tpope/vim-commentary"

  -- Language Server Provider
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }
end)
