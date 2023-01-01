local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  -- UI
  use({
	      "catppuccin/nvim",
	      as = "catppuccin"
      })
  use {
    'goolord/alpha-nvim',
    config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
  }
  use {
    'j-hui/fidget.nvim',
  }
  use "p00f/nvim-ts-rainbow"
  use "rcarriga/nvim-notify" -- notify
  --ransparent
  use "xiyaowong/nvim-transparent"
  use {"gelguy/wilder.nvim",
  requires = { { "romgrk/fzy-lua-native", after = "wilder.nvim" } },
  }
  --tree
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icon
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  use "mbbill/undotree"
  use "simrat39/symbols-outline.nvim" -- outline
  --buffer
  use {'akinsho/bufferline.nvim',tag = "v2.*", requires = 'nvim-tree/nvim-web-devicons'}
  use "moll/vim-bbye"
  use "nvim-lualine/lualine.nvim" -- status line
  use {
    "SmiteshP/nvim-gps",
    requires = "nvim-treesitter/nvim-treesitter"
  }

--TOOLS
  use {"folke/which-key.nvim"}
  --telescope
  use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'nvim-telescope/telescope-media-files.nvim'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use "ahmedkhalf/project.nvim" -- project manager
  use {
  "nvim-telescope/telescope-frecency.nvim",
  config = function()
    require"telescope".load_extension("frecency")
  end,
  requires = {"tami5/sqlite.lua"}
  }
  use "MattesGroeger/vim-bookmarks"
  use "tom-anders/telescope-vim-bookmarks.nvim"
  use "lewis6991/impatient.nvim" -- Speed up loading Lua modules    TODO: figure out how to use this
--COMPLETION
  --cmp
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
  --lsp
  -- use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "williamboman/mason.nvim" 
  use "williamboman/mason-lspconfig.nvim"
  use "WhoIsSethDaniel/mason-tool-installer.nvim"
  use "neovim/nvim-lspconfig" -- enable LSP
  --use "kosayoda/nvim-lightbulb" -- code action
  --
  use "ray-x/lsp_signature.nvim" -- show function signature when typing
  use "folke/trouble.nvim"
  --treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use {
    "nvim-treesitter/nvim-treesitter-textobjects",
    commit = "c81382328ad47c154261d1528d7c921acad5eae5",
  } -- enhance texetobject selection
  --debug
  -- use "Pocco81/dap-buddy.nvim" -- help us install several debuggers
  use "ravenxrz/DAPInstall.nvim" -- help us install several debuggers
  use "theHamsta/nvim-dap-virtual-text"
  use 'mfussenegger/nvim-dap'
  use "rcarriga/nvim-dap-ui"
  use {
    "sakhnik/nvim-gdb",
    run = "./install.sh"
  }

--EDITOR
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "terrortylor/nvim-comment"
  use "lukas-reineke/indent-blankline.nvim"
  use "RRethy/vim-illuminate" -- highlight undercursor word
  use { "rhysd/accelerated-jk", event = "BufReadPost" }
  use "hrsh7th/vim-eft"
  use {
    "phaazon/hop.nvim", -- like easymotion, but more powerful
    branch = "v1", -- optional but strongly recommended
  }
  use "norcalli/nvim-colorizer.lua" -- show color
  use "abecodes/tabout.nvim"
  use "brglng/vim-im-select"
  use "ravenxrz/vim-local-history"
  use "mg979/vim-visual-multi"
  --term
  use "vimlab/split-term.vim"
  use {
        "akinsho/toggleterm.nvim", 
        tag = 'v1.*',
      }
  --git
  use "lewis6991/gitsigns.nvim"
  use "sindrets/diffview.nvim"
  use "junegunn/vim-easy-align" 
 -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
