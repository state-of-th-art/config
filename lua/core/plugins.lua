require("lazy").setup({
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
  }, "tpope/vim-commentary", "mattn/emmet-vim", "nvim-tree/nvim-tree.lua", "nvim-tree/nvim-web-devicons", "dracula/vim",
  "nvim-treesitter/nvim-treesitter", "lewis6991/gitsigns.nvim", "tpope/vim-fugitive",
  "tpope/vim-surround", -- completion
  "hrsh7th/nvim-cmp", "hrsh7th/cmp-nvim-lsp", "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  {
    "nvim-neo-tree/neo-tree.nvim",
    event = "VimEnter",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  },
  {
    "romgrk/barbar.nvim",
    event = "BufEnter",
    dependencies = {
      "lewis6991/gitsigns.nvim",     -- OPTIONAL: for git status
      "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
    }
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim', {
      "nvim-telescope/telescope-live-grep-args.nvim",
      version = "^1.0.0",
    },
      { "aaronhallaert/advanced-git-search.nvim" },
    }

  },
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  }
})
