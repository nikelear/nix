require("dapui").setup()
vim.keymap.set('n', '<F5>', ':DapContinue<CR>', { silent = true })
vim.keymap.set('n', '<F10>', ':DapStepOver<CR>', { silent = true })
vim.keymap.set('n', '<F11>', ':DapStepInto<CR>', { silent = true })
vim.keymap.set('n', '<F12>', ':DapStepOut<CR>', { silent = true })
vim.keymap.set('n', '<leader>db', ':DapToggleBreakpoint<CR>', { desc = '[D]ap [B]reakpoint', silent = true })
vim.keymap.set('n', '<leader>dc', ':lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Breakpoint condition: "))<CR>', { desc = '[D]ap Breakpoint [C]ondition', silent = true })
vim.keymap.set('n', '<leader>dm', ':lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>', { desc = '[D]ap Logpoint [M]essage', silent = true })
vim.keymap.set('n', '<leader>dr', ':lua require("dap").repl.open()<CR>', { desc = '[D]ap [R]epl Open', silent = true })
vim.keymap.set('n', '<leader>dl', ':lua require("dap").run_last()<CR>', { desc = '[D]ap Run [L]ast', silent = true })
vim.keymap.set('n', '<leader>da', ':lua require("dapui").toggle()<CR>', { desc = '[D]ap [A]cribate'})

local dap = require('dap')

dap.adapters.lldb = {
  type = 'executable',
  command = lldbpath .. '/bin/lldb-vscode', -- lldb-vscode のパスを指定します
  name = 'lldb'
}

dap.configurations.c = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    externalConsole = true,
    stopOnEntry = false,
    args = {},
  },
}

dap.configurations.rust = dap.configurations.c
dap.configurations.cpp = dap.configurations.c

