-- Perform the necessary installations if it is the first time
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[ packadd packer.nvim ]]

    return true
  end

  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd [[ autocmd BufWritePost plugins.lua source <afile> | PackerCompile ]]

local function plugins(use)
  use 'wbthomason/packer.nvim'

  use {
    'goolord/alpha-nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('config.alpha').config()
    end
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('config.lualine').config()
    end
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('config.telescope').config()
    end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('config.tree').config()
    end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate",
    config = function()
      require('config.treesitter').config()
    end
  }

  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'RRethy/vim-illuminate',
    },
    config = function()
      require('config.cmp').config()
    end
  }

  use {
    'windwp/nvim-autopairs',
    requires = { 'nvim-treesitter/nvim-treesitter', 'hrsh7th/nvim-cmp' },
    config = function()
      require('config.autopairs').config()
    end
  }

  use {
    'danymat/neogen',
    requries = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('config.neogen').config()
    end
  }

  use {
    'akinsho/bufferline.nvim',
    tag = "v3.*",
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('config.bufferline').config()
    end
  }

  use {
    'numToStr/Comment.nvim',
    requires = { 'JoosepAlviste/nvim-ts-context-commentstring' },
    config = function()
      require('config.comment').config()
    end
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('config.gitsigns').config()
    end
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('config.indent-blankline').config()
    end
  }

  use {
    "ThePrimeagen/refactoring.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter"
    },
    config = function()
      require('config.refactoring').config()
    end
  }

  use {
    "folke/which-key.nvim",
    config = function()
      require('config.which-key').config()
    end
  }

  use {
    "neovim/nvim-lspconfig",
    requires = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "RRethy/vim-illuminate",
      "jose-elias-alvarez/null-ls.nvim",
      "b0o/schemastore.nvim",
    },
    config = function()
      require('config.lsp').config()
    end
  }

  use {
    'folke/tokyonight.nvim',
    config = function()
      vim.cmd([[ colorscheme tokyonight ]])
    end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  if packer_bootstrap then
    require('packer').sync()
  end
end

local packer = require("packer")

packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
})

packer.startup(plugins)
