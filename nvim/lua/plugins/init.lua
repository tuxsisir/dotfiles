---@type NvPluginSpec[]
return {
  -- LSP: servers are configured in configs/lspconfig.lua, installed with :MasonInstallAll
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    cmd = "ConformInfo",
    opts = require "configs.conform",
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      -- compiled fzf sorter: faster, better ranking than the default lua one
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          height = 0.95,
          prompt_position = "top",
        },
      },
    },
    config = function(_, opts)
      local telescope = require "telescope"
      telescope.setup(opts)
      telescope.load_extension "fzf"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- NvChad's defaults (this list replaces theirs)
        "lua",
        "luadoc",
        "printf",
        "vim",
        "vimdoc",

        "bash",
        "fish",
        "python",
        "html",
        "htmldjango",
        "css",
        "scss",
        "javascript",
        "typescript",
        "tsx",
        "vue",
        "json",
        "yaml",
        "toml",
        "c",
        "markdown",
        "markdown_inline",
        "regex",
      },
    },
  },

  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      dashboard = { enabled = true, example = "advanced" },
      explorer = { enabled = true },
      input = { enabled = true },
      picker = { enabled = true },
      notifier = { enabled = true },
      scroll = { enabled = true },
      words = { enabled = true },
      zen = { enabled = true },
    },
    keys = {
      {
        "<leader>gg",
        function()
          Snacks.lazygit()
        end,
        desc = "Lazygit",
      },
      {
        "<leader>z",
        function()
          Snacks.zen()
        end,
        desc = "Zen Mode",
      },
    },
  },

  -- Completion & AI
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "hrsh7th/cmp-cmdline",
      {
        "supermaven-inc/supermaven-nvim",
        opts = {
          keymaps = {
            accept_suggestion = "<C-f>",
            clear_suggestion = "<Nop>",
            accept_word = "<C-y>",
          },
        },
      },
    },
    init = function()
      vim.g.toggle_cmp = true
      vim.keymap.set("n", "<leader>oa", function()
        vim.g.toggle_cmp = not vim.g.toggle_cmp
        vim.notify(vim.g.toggle_cmp and "Toggled On" or "Toggled Off", vim.log.levels.INFO, { title = "Autocomplete" })
      end, { desc = "Options | Toggle Autocomplete" })
    end,
    config = function(_, opts)
      local cmp = require "cmp"
      local luasnip = require "luasnip"

      table.insert(opts.sources, 1, { name = "supermaven" })
      opts.completion.completeopt = "menu,menuone,noselect" -- disable autoselect
      opts.enabled = function()
        return vim.g.toggle_cmp and vim.bo.buftype == ""
      end

      for _, ft in ipairs { "javascriptreact", "typescriptreact", "svelte", "vue", "php" } do
        luasnip.filetype_extend(ft, { "html" })
      end
      luasnip.filetype_extend("javascript", { "javascriptreact" })
      luasnip.filetype_extend("typescript", { "typescriptreact" })

      cmp.setup(opts)
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = { { name = "cmdline" } },
      })
    end,
  },

  { "windwp/nvim-ts-autotag", event = { "BufReadPre", "BufNewFile" }, opts = {} },

  { "folke/trouble.nvim", cmd = "Trouble", opts = {} },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreview", "MarkdownPreviewToggle" },
    ft = "markdown",
    -- downloads a prebuilt binary, so no node/yarn needed
    build = function()
      require("lazy").load { plugins = { "markdown-preview.nvim" } }
      vim.fn["mkdp#util#install"]()
    end,
  },

  -- code folding
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    event = "BufReadPost",
    init = function()
      vim.o.foldcolumn = "0"
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
    end,
    opts = {
      provider_selector = function()
        return { "treesitter", "indent" }
      end,
    },
    keys = {
      {
        "zR",
        function()
          require("ufo").openAllFolds()
        end,
        desc = "Open all folds",
      },
      {
        "zM",
        function()
          require("ufo").closeAllFolds()
        end,
        desc = "Close all folds",
      },
    },
  },

  -- sticky scope header while scrolling
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPost",
    opts = {
      max_lines = 0,
      min_window_height = 0,
      line_numbers = true,
      multiline_threshold = 20,
      trim_scope = "outer",
      mode = "cursor",
    },
  },

  -- AI CLIs (claude, etc.) in a tmux split
  {
    "folke/sidekick.nvim",
    opts = {
      cli = {
        mux = {
          backend = "tmux",
          enabled = true,
        },
      },
    },
    keys = {
      {
        "<c-.>",
        function()
          require("sidekick.cli").focus()
        end,
        mode = { "n", "t", "i", "x" },
        desc = "Sidekick Focus",
      },
      {
        "<leader>aa",
        function()
          require("sidekick.cli").toggle()
        end,
        desc = "Sidekick Toggle CLI",
      },
      {
        "<leader>as",
        function()
          require("sidekick.cli").select()
        end,
        desc = "Select CLI",
      },
      {
        "<leader>ad",
        function()
          require("sidekick.cli").close()
        end,
        desc = "Detach a CLI Session",
      },
      {
        "<leader>at",
        function()
          require("sidekick.cli").send { msg = "{this}" }
        end,
        mode = { "x", "n" },
        desc = "Send This",
      },
      {
        "<leader>af",
        function()
          require("sidekick.cli").send { msg = "{file}" }
        end,
        desc = "Send File",
      },
      {
        "<leader>av",
        function()
          require("sidekick.cli").send { msg = "{selection}" }
        end,
        mode = { "x" },
        desc = "Send Visual Selection",
      },
      {
        "<leader>ap",
        function()
          require("sidekick.cli").prompt()
        end,
        mode = { "n", "x" },
        desc = "Sidekick Select Prompt",
      },
      {
        "<leader>ac",
        function()
          require("sidekick.cli").toggle { name = "claude", focus = true }
        end,
        desc = "Sidekick Toggle Claude",
      },
    },
  },
}
