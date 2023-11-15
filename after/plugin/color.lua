local function colorMe(color)
  color = color or "dracula-soft"
  vim.cmd.colorscheme(color)
  vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
  vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})

  -- asdasdasd
  vim.cmd [[
  autocmd InsertEnter * highlight CursorLine guibg=bg guifg=fg
  autocmd InsertLeave * highlight CursorLine guibg=#363636 guifg=fg
  ]]
  vim.api.nvim_set_hl(0, "CursorLine", {bg = "#363636"})
end


colorMe()


