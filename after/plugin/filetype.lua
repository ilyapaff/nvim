vim.filetype.add({
 filename = {
   [os.getenv('HOME') .. '/.kube/config'] = 'yaml',
   ['go.mod'] = 'gomod'
 },
})

