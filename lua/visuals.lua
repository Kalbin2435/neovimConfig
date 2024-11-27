-- vim.cmd("hi Normal NC ctermbg=NONE guibg=NONE")
-- Define a function to remove background color
local function set_transparent_background()
    vim.api.nvim_set_hl(0, "Normal", { ctermbg = "NONE"})
  end
  
  -- Create an autocmd to apply the function when a colorscheme is loaded
  vim.api.nvim_create_autocmd("ColorScheme", {
    callback = set_transparent_background,
  })
  
  -- Optionally, you can apply it immediately if you've already set a colorscheme
vim.cmd("colorscheme onedark")
set_transparent_background()
  

