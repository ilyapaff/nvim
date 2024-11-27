vim.filetype.add({
 filename = {
   [os.getenv('HOME') .. '/.kube/config'] = 'yaml',
   ['.*ya?ml%.tpl'] = 'yaml',
   ['go.mod'] = 'gomod'
 },
})

-- Отступы для terraform
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*.tf",
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
	end
})

vim.filetype.add({
  extension = {
    gotmpl = 'gotmpl',
  },
  pattern = {
    [".*/templates/.*%.tpl"] = "helm",
    [".*/templates/.*%.ya?ml"] = "helm",
    ["helmfile.*%.ya?ml"] = "helm",
    [".*/values.*%.ya?ml"] = "helm",
  },
})

