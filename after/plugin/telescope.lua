local builtin = require('telescope.builtin')
local tele = require('telescope')
tele.load_extension('k8s_commands')
tele.setup {
  extensions = {
		k8s_commands = {
			k8s_cmd = "kubectl" -- defaults to kubectl
		}
	},
}

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fs', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set("n","<leader>k", ":lua require('telescope').load_extension('k8s_commands').k8s()<CR>", opts)

