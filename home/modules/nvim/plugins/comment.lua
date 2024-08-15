require("Comment").setup()
local opt = { noremap = true, silent = true }
vim.keymap.set("n", "<C-/>", "<Plug>(comment_toggle_linewise_current)", {})
vim.keymap.set("v", "<C-/>", "<Plug>(comment_toggle_linewise_visual)", {})
vim.keymap.set('i', '<C-/>', [[jjj<Esc>:normal gcc<CR>:s/jjj//g<CR>A]], {})
