local map = vim.api.nvim_set_keymap
local opts = { silent = true, noremap = true }

require('onedark').setup {
  style = 'darker'
}
require('onedark').load()

vim.cmd [[
set number
]]
