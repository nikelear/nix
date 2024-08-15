-- general
vim.keymap.set('n', "<C-s>",'<cmd>write<CR>')
vim.keymap.set('i', "<C-s>",'<cmd>write<CR>')
vim.keymap.set('n', '<leader><esc>','<cmd>q!<CR>')
vim.keymap.set('n', '<leader>gg', '<cmd>LazyGit<cr>', { desc = 'Lazy[G]it' })


-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- diagnostic
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- telescope
vim.keymap.set('n', '<leader>?', '<cmd>Telescope oldfiles<CR>', { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', '<cmd>Telescope buffers<CR>', { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>ss', '<cmd>Telescope builtin<CR>', { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>gf', '<cmd>Telescope git_files<CR>', { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', '<cmd>Telescope find_files<CR>', { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', '<cmd>Telescope help_tags<CR>', { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', '<cmd>Telescope grep_string<CR>', { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', '<cmd>Telescope live_grep<CR>', { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sG', '<cmd>LiveGrepGitRoot<cr><CR>', { desc = '[S]earch by [G]rep on Git Root' })
vim.keymap.set('n', '<leader>sd', '<cmd>Telescope diagnostics<CR>', { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', '<cmd>Telescope resume<CR>', { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>su', '<cmd>Telescope undo<CR>', { desc = '[S]earch [U]ndo History' })
vim.keymap.set("n", "<leader>lg", require("telescope-live-grep-args.shortcuts").grep_word_under_cursor, { desc = '[L]ive [G]rep' })

vim.keymap.set('n', '<C-f>', '<cmd>Telescope file_browser<CR>', { desc = '[F]ile Brouser' })
vim.keymap.set('i', '<C-f>', '<cmd>Telescope file_browser<CR>', { desc = '[F]ile Brouser' })

local function telescope_plugin_find()
  require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
end
vim.keymap.set('n','<leader>sp', telescope_plugin_find, { desc = '[S]earch [P]lugin files' })

local function telescope_buffer_fuzzy_find()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end
vim.keymap.set('n', '<leader>/', telescope_buffer_fuzzy_find, { desc = '[/] Fuzzily search in current buffer' })

local function telescope_live_grep_open_files()
  require('telescope.builtin').live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end
vim.keymap.set('n', '<leader>s/', telescope_live_grep_open_files, { desc = '[S]earch [/] in Open Files' })
