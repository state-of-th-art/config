local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Neo-tree keybindings
map('n', '<leader>n', ':Neotree toggle<CR>', { noremap = true, silent = true, desc = "Toggle Neo-tree" })

-- Barbar
-- Move to previous/next buffer
map('n', '<S-h>', '<Cmd>BufferPrevious<CR>', { noremap = true, silent = true, desc = "Previous Buffer" })
map('n', '<S-l>', '<Cmd>BufferNext<CR>', { noremap = true, silent = true, desc = "Next Buffer" })

-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', { noremap = true, silent = true, desc = "Move Buffer Left" })
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', { noremap = true, silent = true, desc = "Move Buffer Right" })

-- Goto buffer in position...
for i = 1, 9 do
  map('n', '<A-' .. i .. '>', '<Cmd>BufferGoto ' .. i .. '<CR>',
    { noremap = true, silent = true, desc = "Go to Buffer " .. i })
end
map('n', '<A-0>', '<Cmd>BufferLast<CR>', { noremap = true, silent = true, desc = "Go to Last Buffer" })

-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', { noremap = true, silent = true, desc = "Pin/Unpin Buffer" })

-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', { noremap = true, silent = true, desc = "Close Buffer" })

-- Sort automatically by...
map('n', '<leader>bn', '<Cmd>BufferOrderByName<CR>', { noremap = true, silent = true, desc = "Sort Buffers by Name" })
map('n', "<leader>bp", "<Cmd>BufferCloseAllButPinned<CR>",
  { noremap = true, silent = true, desc = "Close All But Pinned Buffers" })
map('n', "<leader>bl", "<Cmd>BufferCloseBuffersLeft<CR>",
  { noremap = true, silent = true, desc = "Close Buffers to the Left" })
map('n', "<leader>br", "<Cmd>BufferCloseBuffersRight<CR>",
  { noremap = true, silent = true, desc = "Close Buffers to the Right" })
map('n', '<leader>bd', '<Cmd>BufferOrderByDirectory<CR>',
  { noremap = true, silent = true, desc = "Sort Buffers by Directory" })
map('n', '<leader>bl', '<Cmd>BufferOrderByLanguage<CR>',
  { noremap = true, silent = true, desc = "Sort Buffers by Language" })
map('n', "<leader>bc", "<Cmd>BufferCloseAllButCurrent<CR>",
  { noremap = true, silent = true, desc = "Close All But Current Buffer" })


map('n', '<leader>s', 'yiw/\\V<C-r>"<CR>', { noremap = true, silent = true })
map('v', '<leader>s', 'y/\\V<C-r>=escape(@",\'/\\\')<CR><CR>', { noremap = true, silent = true })
