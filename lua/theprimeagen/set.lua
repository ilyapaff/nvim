vim.opt.nu = true
vim.opt.relativenumber = true

-- vim.opt.clipboard = 'unnamedplus'
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true -- autoindent new lines


vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true


-- Цвета
vim.opt.termguicolors = true
vim.opt.cursorline = true


vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
-- vim.opt.colorcolumn = "120"

vim.g.mapleader = " "

vim.g.python3_host_prog = '/usr/bin/python3'
vim.g.python_host_prog = '/usr/bin/python3'


vim.opt.spelllang= { 'en_us', 'ru' }
-- 2 spaces for selected filetypes
vim.cmd [[autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml,htmljinja setlocal shiftwidth=2 tabstop=2]]

-- С этой строкой отлично форматирует html файл, который содержит jinja2
vim.cmd [[ autocmd BufNewFile,BufRead *.html set filetype=htmldjango ]]

-- Запоминает где nvim последний раз редактировал файл
vim.cmd [[autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]]

-- Подсвечивает на доли секунды скопированную часть текста
vim.api.nvim_exec([[augroup YankHighlight autocmd! autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700} augroup end ]], false)

