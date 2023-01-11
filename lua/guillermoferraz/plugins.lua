local status, packer = pcall(require, "packer")
if not status then
  print("Packer is not installed")
  return
end

vim.cmd([[packadd packer.nvim]])

packer.startup(function(use)
  use("wbthomason/packer.nvim")

  -- Statusline
  use("nvim-lualine/lualine.nvim")

  -- Common utilities
  use("nvim-lua/plenary.nvim")
  use("onsails/lspkind-nvim") -- vscode-like pictograms
  use("windwp/nvim-autopairs")
  use("windwp/nvim-ts-autotag")
  use("norcalli/nvim-colorizer.lua")
  use("folke/zen-mode.nvim")
  use("lukas-reineke/indent-blankline.nvim")

  -- complementation
  use("hrsh7th/cmp-buffer") -- nvim-cmp source for buffer words
  use("hrsh7th/cmp-nvim-lsp") -- nvim-cmp source for neovim's built-in LSP
  use("hrsh7th/nvim-cmp") -- Completion
  use("glepnir/lspsaga.nvim") -- LSP UIs
  use("rafamadriz/friendly-snippets")
  use {
    'L3MON4D3/LuaSnip',
    config = function()
      require("luasnip/loaders/from_vscode").load({ paths = { "~/.local/share/nvim/site/pack/packer/start/friendly-snippets/snippets" } })
    end
  }

  -- lsp config an package
  use("neovim/nvim-lspconfig") -- LSP
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")

  -- format and diagnostic
  use("jose-elias-alvarez/null-ls.nvim")

  -- prettier formatter
  use("MunifTanjim/prettier.nvim") -- Prettier plugin for Neovim's built-in LSP client

  -- treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
  })
  use('nvim-treesitter/playground')

  -- telescope
  use("kyazdani42/nvim-web-devicons") -- File icons
  use("nvim-telescope/telescope.nvim")
  use("nvim-telescope/telescope-file-browser.nvim")

  -- buffer manager
  use("akinsho/nvim-bufferline.lua")

  -- git
  use("lewis6991/gitsigns.nvim")
  use("dinhhuy258/git.nvim") -- For git blame & browse
  use('tpope/vim-fugitive')

  -- experimental interface cmd
  use({
    "folke/noice.nvim",
    config = function()
      require("noice").setup({
        -- add any options here
      })
    end,
    requires = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  })

  -- tree
  use({
    "kyazdani42/nvim-tree.lua",
    requires = {
      "kyazdani42/nvim-web-devicons", -- optional, for file icons
    },
  })

  --terminal
  use({ "akinsho/toggleterm.nvim", tag = "*" })

  -- theme
  use({
    'folke/tokyonight.nvim',
    as = 'tokyonight.nvim',
    config = function()
      vim.cmd('colorscheme tokyonight.nvim')
    end
  })
  use ('folke/tokyonight.nvim')

  -- the primeagen
  use('theprimeagen/harpoon')

  -- redo tree
  use('mbbill/undotree')

  -- Color Picker
  use ({"ziontee113/color-picker.nvim",
    config = function()
        require("color-picker")
    end,
  })

  -- install without yarn or npm
use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
})

use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

end)
