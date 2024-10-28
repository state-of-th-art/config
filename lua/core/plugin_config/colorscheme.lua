require("catppuccin").setup({
  flavour = "auto",
  background = { -- :h background
    light = "latte",
    dark = "mocha",
  },
  transparent_background = false,
  styles = {                 -- Handles the styles of general hi groups (see `:h highlight-args`):
    comments = { "italic" }, -- Change the style of comments
  },
  integrations = {
    cmp = true,
    treesitter = true,
    barbar = true,
    neotree = true
  },
})

local function set_background_based_on_time()
  local hour = tonumber(os.date("%H"))
  if hour >= 18 or hour < 6 then
    -- It's either evening or night
    vim.o.background = "dark"
  else
    -- It's day
    vim.o.background = "light"
  end
end

set_background_based_on_time()
vim.o.termguicolors = true
vim.cmd [[colorscheme tokyonight]]
