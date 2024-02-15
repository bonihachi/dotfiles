local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here

  use({ "wbthomason/packer.nvim" })
  use({ "nvim-lua/plenary.nvim" }) -- Common utilities

  -- Colorschemes
  use({ "EdenEast/nightfox.nvim" }) -- Color scheme
  use({ "folke/tokyonight.nvim" })
  use({ "shaunsingh/nord.nvim" })
  use({ "cocopon/iceberg.vim" })

  use({ "nvim-lualine/lualine.nvim" })    -- Statusline
  use({ "windwp/nvim-autopairs" })        -- Autopairs, integrates with both cmp and treesitter
  use({ "kyazdani42/nvim-web-devicons" }) -- File icons
  use({ "akinsho/bufferline.nvim" })

  -- LSP
  use({ "neoclide/coc.nvim", branch = 'release' })
  use({ 'neovim/nvim-lspconfig' })
  use({ 'lighttiger2505/sqls' }) -- LSP for SQL

  -- Formatter
  use({ "MunifTanjim/prettier.nvim" })

  -- Telescope
  use({ "nvim-telescope/telescope.nvim" })

  -- Treesitter
  use({ "nvim-treesitter/nvim-treesitter" })
  use({ "nvim-telescope/telescope-file-browser.nvim" })
  use({ "mrjones2014/nvim-ts-rainbow" })

  -- Visualize the scope of a hovered variable
  use({ "shellRaining/hlchunk.nvim" })

  use({ "windwp/nvim-ts-autotag" })

  -- Rich command line
  use({ "folke/noice.nvim" })
  -- dependencies
  use({ "MunifTanjim/nui.nvim" })
  use({ "rcarriga/nvim-notify" })

  -- rust integration

  -- cmp plugins
  use({ 'hrsh7th/nvim-cmp' })    -- completion plugin
  use({ 'hrsh7th/cmp-path' })    -- path completions
  use({ 'hrsh7th/cmp-cmdline' }) -- cmdline completions
  use({ 'hrsh7th/cmp-nvim-lsp' })
  use({ 'hrsh7th/cmp-nvim-lua' })
  use({ 'onsails/lspkind-nvim' })

  -- better launch screen
  use {
    'goolord/alpha-nvim',
    config = function()
      require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
    end
  }

  -- tree filer
  use({
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim",
      {
        "s1n7ax/nvim-window-picker",
        version = "2.*",
      },
    },
  })

  -- git
  use("dinhhuy258/git.nvim")
  use("lewis6991/gitsigns.nvim")

  -- colorizer
  use({ "norcalli/nvim-colorizer.lua" })

  use({ 'lewis6991/impatient.nvim' })

  use({ 'gen740/SmoothCursor.nvim' })

  use({ 'karb94/neoscroll.nvim' })

  use({ 'numToStr/Comment.nvim' })

  use({
    'folke/which-key.nvim',
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end
  })

  use { "akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end }

  use {
    "williamboman/mason.nvim"
  }
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
