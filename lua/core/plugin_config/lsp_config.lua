require("mason-lspconfig").setup({
  ensure_installed       = { "elmls" },
  automatic_installation = true
})

-- LSP configuration
---
vim.opt.signcolumn = 'yes'

local lspconfig = require('lspconfig')

-- Add cmp_nvim_lsp capabilities settings to lspconfig
lspconfig.util.default_config.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig.util.default_config.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

-- Executes the callback function every time a
-- language server is attached to a buffer.
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf, desc = "LSP" } -- General LSP operations, you might want to customize this more specifically.

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>',
      vim.tbl_extend('force', opts, { desc = 'Show hover information' }))
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>',
      vim.tbl_extend('force', opts, { desc = 'Go to definition' }))
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>',
      vim.tbl_extend('force', opts, { desc = 'Go to declaration' }))
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>',
      vim.tbl_extend('force', opts, { desc = 'Go to implementation' }))
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>',
      vim.tbl_extend('force', opts, { desc = 'Go to type definition' }))
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>',
      vim.tbl_extend('force', opts, { desc = 'List references' }))
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>',
      vim.tbl_extend('force', opts, { desc = 'Show signature help' }))
    vim.keymap.set('n', 'cr', '<cmd>lua vim.lsp.buf.rename()<cr>',
      vim.tbl_extend('force', opts, { desc = 'Rename symbol' }))
    vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>',
      vim.tbl_extend('force', opts, { desc = 'Format buffer' }))
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>',
      vim.tbl_extend('force', opts, { desc = 'Show code actions' }))

    -- Diagnostics navigation with descriptions
    vim.keymap.set('n', '<leader>e', function()
      vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
    end, { desc = 'Go to next error only' })
    vim.keymap.set('n', '<leader>E', function()
      vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
    end, { desc = 'Go to previous error only' })
  end,
})

require('lspconfig').elmls.setup({})
require("lspconfig").tsserver.setup({})
require("lspconfig").rust_analyzer.setup({})
require("lspconfig").lua_ls.setup({})
require("lspconfig").cssls.setup({})

---
---
-- Autocompletion setup
---
local cmp = require('cmp')

cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
  },
  snippet = {
    expand = function(args)
      -- You need Neovim v0.10 to use vim.snippet
      vim.snippet.expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
})

---
-- Formatting Setup

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp", { clear = true }),
  callback = function(args)
    -- 2
    vim.api.nvim_create_autocmd("BufWritePre", {
      -- 3
      buffer = args.buf,
      callback = function()
        -- 4 + 5
        vim.lsp.buf.format { async = false, id = args.data.client_id }
      end,
    })
  end
})


--require('lspconfig').tailwindcss.setup {
--  filetypes = { "html", "elm" },
--  init_options = {
--    userLanguages = {
--      elm = "html",
--      html = "html"
--    }
--  },
--  settings = {
--    tailwindCSS = {
--      includeLanguages = {
--        elm = "html",
--        html = "html"
--      },
--      classAttributes = { "class", "className", "classList", "ngClass" },
--      experimental = {
--        classRegex = {
--          "\\bclass[\\s(<|]+\"([^\"]*)\"",
--          "\\bclass[\\s(]+\"[^\"]*\"[\\s+]+\"([^\"]*)\"",
--          "\\bclass[\\s<|]+\"[^\"]*\"\\s*\\+{2}\\s*\" ([^\"]*)\"",
--          "\\bclass[\\s<|]+\"[^\"]*\"\\s*\\+{2}\\s*\" [^\"]*\"\\s*\\+{2}\\s*\" ([^\"]*)\"",
--          "\\bclass[\\s<|]+\"[^\"]*\"\\s*\\+{2}\\s*\" [^\"]*\"\\s*\\+{2}\\s*\" [^\"]*\"\\s*\\+{2}\\s*\" ([^\"]*)\"",
--          "\\bclassList[\\s\\[\\(]+\"([^\"]*)\"",
--          "\\bclassList[\\s\\[\\(]+\"[^\"]*\",\\s[^\\)]+\\)[\\s\\[\\(,]+\"([^\"]*)\"",
--          "\\bclassList[\\s\\[\\(]+\"[^\"]*\",\\s[^\\)]+\\)[\\s\\[\\(,]+\"[^\"]*\",\\s[^\\)]+\\)[\\s\\[\\(,]+\"([^\"]*)\""
--        }
--      },
--      lint = {
--        cssConflict = "warning",
--        invalidApply = "error",
--        invalidConfigPath = "error",
--        invalidScreen = "error",
--        invalidTailwindDirective = "error",
--        invalidVariant = "error",
--        recommendedVariantOrder = "warning"
--      },
--      validate = true
--    }
--  }
--}
