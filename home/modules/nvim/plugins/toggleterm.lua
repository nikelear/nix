require("toggleterm").setup()
vim.keymap.set('n', '<C-j>', '<cmd>exe v:count1 . "ToggleTerm"<cr>', { desc = '[T]oggleTerm' })
