vim.filetype.add({
 filename = {
   [os.getenv('HOME') .. '/.kube/config'] = 'yaml',
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

vim.api.nvim_create_autocmd(
    {
        "BufNewFile",
        "BufRead",
    },
    {
        pattern = "*.yaml,*.yml",
        callback = function()
            if vim.fn.search("{{.\\+}}", "nw") ~= 0 then
                local buf = vim.api.nvim_get_current_buf()
                vim.api.nvim_buf_set_option(buf, "filetype", "helm")
            end
        end
    }
)
