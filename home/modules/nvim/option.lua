-- lua load faster
vim.loader.enable()
-- default color
-- vim.cmd[[colorscheme default]]

-- set leader keys
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- row number
vim.wo.number = true
vim.wo.relativenumber = true
-- keep space for signcolumn
vim.wo.signcolumn = 'yes'

-- LF format
vim.o.fileformat = 'unix'
-- highlight on search
vim.o.hlsearch = false
-- mouse mode
vim.o.mouse = ''
-- share clipboard
-- vim.o.clipboard = 'unnamedplus'
-- keep indent when break
vim.o.breakindent = true
-- save history
vim.o.undofile = true
-- lastcol
-- vim.o.virtualedit = 'onemore'
-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
-- update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- completion settings
vim.o.completeopt = 'menuone,noselect'
-- completion count
vim.o.pumheight = 10

-- terminal 256 colors
vim.o.termguicolors = true
vim.opt.winblend = 0
-- vim.opt.pumblend = 0

vim.opt.list = true
vim.opt.listchars = {
  space = '⋅',
  tab = '>>',
  trail = '-',
  nbsp = '+',
  eol = '↵',
}

vim.api.nvim_create_augroup('extra-whitespace', {})
vim.api.nvim_create_autocmd({'VimEnter', 'WinEnter'}, {
    group = 'extra-whitespace',
    pattern = {'*'},
    command = [[call matchadd('ExtraWhitespace', '[\u00A0\u2000-\u200B\u3000]')]]
})
vim.api.nvim_create_autocmd({'ColorScheme'}, {
    group = 'extra-whitespace',
    pattern = {'*'},
    command = [[highlight default ExtraWhitespace ctermbg=202 ctermfg=202 guibg=salmon]]
})
