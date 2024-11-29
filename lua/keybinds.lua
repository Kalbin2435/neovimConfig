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
vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ts', '<cmd>lua ToggleCurrentSplit("horizontal")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tv', '<cmd>lua ToggleCurrentSplit("vertical")<CR>', { noremap = true, silent = true })


TerminalWindowBufferId = nil
function ToggleCurrentSplit(direction)
    if TerminalWindowBufferId == nil then
        OpenVerticalTerminal(direction)
        local winid = vim.api.nvim_get_current_win()
        TerminalWindowBufferId = vim.api.nvim_win_get_buf(winid)
    elseif IsBufferAttached(TerminalWindowBufferId) then
        HideWindowByBuffer(TerminalWindowBufferId)
    else
        if direction == "vertical" then
            vim.cmd("vsplit")
            vim.cmd("wincmd l")
        else
            vim.cmd("split")
            vim.cmd("wincmd j")
        end
        local new_winid = vim.api.nvim_get_current_win()
        vim.api.nvim_win_set_buf(new_winid, TerminalWindowBufferId)
    end

end

function OpenVerticalTerminal(direction)
    if direction == "vertical" then
        vim.cmd("vsplit")
        vim.cmd("wincmd l")
    elseif direction == "horizontal" then
        vim.cmd("split")
        vim.cmd("wincmd j")
    end
    vim.cmd("term")
    vim.cmd("startinsert")
end

function IsBufferAttached(buffer_id)
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        if vim.api.nvim_win_get_buf(win) == buffer_id then
            return true
        end
    end
    return false
end

function HideWindowByBuffer(buffer_id)
    for _, winid in ipairs(vim.api.nvim_list_wins()) do
        if vim.api.nvim_win_get_buf(winid) == buffer_id then
            vim.api.nvim_win_hide(winid)
            return
        end
    end
end
