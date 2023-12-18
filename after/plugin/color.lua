local function colorMe(color)
  color = color or "dracula-soft"
  vim.cmd.colorscheme(color)
  vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
  vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})

  vim.cmd [[
  autocmd InsertEnter * highlight CursorLine guibg=bg guifg=fg
  autocmd InsertLeave * highlight CursorLine guibg=#363636 guifg=fg
  autocmd InsertEnter * highlight TagbarSignature guibg=bg guifg=fg
  autocmd InsertLeave * highlight TagbarSignature guibg=bg guifg=fg
  ]]
  vim.api.nvim_set_hl(0, "CursorLine", {bg = "#363636"})
  vim.api.nvim_set_hl(0, "TagbarSignature", {bg = "none"})
end

-- Подсветка дебагера
vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#993939', bg = 'none' })
vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef', bg = '#31353f' })
vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379', bg = '#31353f' })

vim.fn.sign_define('DapBreakpoint', { text='⊙', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointCondition', { text='ﳁ', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointRejected', { text='', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl= 'DapBreakpoint' })
vim.fn.sign_define('DapLogPoint', { text='', texthl='DapLogPoint', linehl='DapLogPoint', numhl= 'DapLogPoint' })
vim.fn.sign_define('DapStopped', { text='', texthl='DapStopped', linehl='DapStopped', numhl= 'DapStopped' })

---

colorMe()


