TerminalWindowBufferId = nil
function ToggleCurrentSplit(direction)
    if not IsBufferValid(TerminalWindowBufferId) then
        TerminalWindowBufferId = nil
    end
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
        vim.cmd("startinsert")
    end

end

function IsBufferValid(buffer_id)
    return vim.fn.bufexists(buffer_id) == 1
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
