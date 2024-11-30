vim.opt.guicursor = ""


vim.opt.nu = true
vim.opt.rnu = true

vim.opt.tabstop = 4

vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false


vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.keymap.set("n", "Q", "<nop>")

vim.g.mapleader = " "
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>e', ':Ex<CR>', { noremap = true, silent = true })
vim.cmd [[autocmd FileType netrw set relativenumber]]
vim.cmd [[autocmd FileType netrw set number]]

vim.api.nvim_set_keymap('n', '<leader>se', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<Esc>', '<cmd>lua ToggleCurrentSplit("horizontal")<CR>', { noremap = true, silent = true })

-- Terminal Horizontal
vim.api.nvim_set_keymap('n', '<leader>ts', '<cmd>lua ToggleCurrentSplit("horizontal")<CR>', { noremap = true, silent = true })

-- Terminal Vertical
vim.api.nvim_set_keymap('n', '<leader>tv', '<cmd>lua ToggleCurrentSplit("vertical")<CR>', { noremap = true, silent = true })

-- Tab Open
vim.api.nvim_set_keymap('n', '<leader>to', '<cmd>lua OpenBufferInNewTab()<CR>', { noremap = true, silent = true })

-- Tab Delete
vim.api.nvim_set_keymap('n', '<leader>td', '<cmd>lua CloseTabAndReturn()<CR>', { noremap = true, silent = true })

