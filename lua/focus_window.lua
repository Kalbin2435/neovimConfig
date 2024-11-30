-- Store tab and buffer state globally
local buffer_tab_stack = {}
local current_new_tab = nil

-- Function to open the current focused buffer in a new tab and save the previous tab info
function OpenBufferInNewTab()
    local current_tab = vim.api.nvim_get_current_tabpage()
    local current_win = vim.api.nvim_get_current_win()
    local buf_id = vim.api.nvim_win_get_buf(current_win)

    -- Save the current tab information for the buffer
    table.insert(buffer_tab_stack, current_tab)

    -- Open the buffer in a new tab
    vim.api.nvim_command('tabnew')
    vim.api.nvim_win_set_buf(0, buf_id)
    current_new_tab = vim.api.nvim_get_current_tabpage()
end

-- Function to close the current tab and return to the original tab
function CloseTabAndReturn()
    if current_new_tab then
        -- Close the new tab that was opened
        vim.api.nvim_set_current_tabpage(current_new_tab)
        vim.api.nvim_command('tabclose')

        -- Get the last tab from the stack and switch to it
        if #buffer_tab_stack > 0 then
            local last_tab = table.remove(buffer_tab_stack)
            current_new_tab = last_tab
            vim.api.nvim_set_current_tabpage(last_tab)
        else
            current_new_tab = nil
        end
    end
end

-- Example Usage:
-- To open the current buffer in a new tab:
-- OpenBufferInNewTab()
-- To close the current tab and return to the original tab:
-- CloseTabAndReturn()

