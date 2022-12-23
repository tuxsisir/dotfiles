-- https://github.com/LunarVim/Neovim-from-scratch/blob/master/lua/user/plugins.lua

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

-- Autocommand that reloads neovim whenever you save the packer-plugins.lua file
vim.cmd([[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost packer-plugins.lua source <afile> | PackerSync
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

return require("packer").startup(function(use)
  -- packer can manage itself
  use({ "wbthomason/packer.nvim" })
  use({ "nvim-lua/plenary.nvim" })
  use({ "lewis6991/impatient.nvim" })

  use({
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup({
        show_trailing_blankline_indent = false,
        show_first_indent_level = true,
        show_current_context = true,
        show_current_context_start = false,
        space_char_blankline = " ",
        use_treesitter = true,
        char = "┊",
        indent_blankline_filetype_exclude = "markdown",
      })
    end,
  })
  use({
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  })
  use({
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        user_default_options = {
          rgb_fn = true,
        },
      })
    end,
  })

  -- editorconfig
  use({ "gpanders/editorconfig.nvim" })

  -- vimwiki
  use({
    "vimwiki/vimwiki",
    config = function()
      vim.g.vimwiki_conceallevel = 0
      vim.g.vimwiki_list = {
        {
          path = "~/projects/tuxchirpy/_posts/",
          syntax = "markdown",
          ext = ".md",
        },
      }
    end,
  })

  -- tree explorer
  use({
    "nvim-tree/nvim-tree.lua",
    requires = { "nvim-tree/nvim-web-devicons" },
    tag = "nightly",
  })

  use({
    "goolord/alpha-nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("alpha").setup(require("alpha.themes.startify").config)
    end,
  })

  -- use({ "RRethy/vim-illuminate" })

  use({
    "xiyaowong/nvim-transparent",
    config = function()
      require("transparent").setup({
        enable = true,
        extra_groups = {
          "BufferLineFill",
        },
      })
    end,
  })

  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  })

  use({
    "akinsho/bufferline.nvim",
    tag = "v3.*",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup({})
    end,
  })

  use({ "lewis6991/gitsigns.nvim" })

  -- colorscheme
  use({ "rmehri01/onenord.nvim" })
  use({ "navarasu/onedark.nvim" })
  use({ "gruvbox-community/gruvbox" })
  use({ "folke/tokyonight.nvim" })

  -- autocompletions
  use({ "hrsh7th/nvim-cmp" }) -- completion plugin
  use({ "hrsh7th/cmp-nvim-lsp" })
  use({ "hrsh7th/cmp-buffer" }) -- source for text in buffer
  use({ "hrsh7th/cmp-path" }) -- source for file system paths
  use({ "hrsh7th/cmp-cmdline" }) -- source for file system paths

  use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions

  -- snippets
  use({ "L3MON4D3/LuaSnip" }) --snippet engine
  use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use

  -- configuring lsp servers
  use({
    "seblj/nvim-echo-diagnostics",
    config = function()
      require("echo-diagnostics").setup({
        show_diagnostic_number = true,
        show_diagnostic_source = true,
      })
    end,
  })
  use({ "neovim/nvim-lspconfig" })
  use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
  use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion
  use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)

  -- formatting & linting
  use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
  use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

  -- managing and installing lsp servers
  use({ "williamboman/mason.nvim" })
  use({ "williamboman/mason-lspconfig.nvim" })

  -- treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })

  -- Telescope
  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.0",
  })
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use({
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({
        show_hidden = true,
        silent_chdir = false,
      })
    end,
  })
  use({
    "kylechui/nvim-surround",
    tag = "*",
    config = function()
      require("nvim-surround").setup({})
    end,
  })

  -- auto closing
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  }) -- autoclose parens, brackets, quotes, etc...

  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

  -- whichkey
  use({
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup({})
    end,
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
