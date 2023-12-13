vim.g.mapleader = " "

-- Выход в проводник
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- При выделении перемещает выделеный текст
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Перемещает следующую строку в конец этой
vim.keymap.set("n", "J", "mzJ`z")

-- Прыгает на пол экрана с центрированием в середину
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Центрирует результат поиска
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>P", [["+p]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- Открыть новый tab
vim.keymap.set('n', '<C-t>', vim.cmd.tabnew)
vim.keymap.set('n', '<leader>tc', vim.cmd.tabclose)
vim.keymap.set('n', '<leader>tn', vim.cmd.tabnext)
vim.keymap.set('n', '<leader>to', vim.cmd.tabonly)

-- Регексп замена для слова под курсором
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

vim.keymap.set("n", "<C-j>", "jzz")
vim.keymap.set("n", "<C-k>", "kzz")

vim.keymap.set("n", "<leader>o", vim.cmd.Neotree)

vim.keymap.set("n", "<leader>gu", vim.cmd.TagbarToggle)


