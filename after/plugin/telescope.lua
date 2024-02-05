local builtin = require('telescope.builtin')
local project_actions = require("telescope._extensions.project.actions")
-- local tele = require('telescope')
-- tele.load_extension('k8s_commands')
-- tele.setup {
--   extensions = {
-- 		k8s_commands = {
-- 			k8s_cmd = "kubectl" -- defaults to kubectl
-- 		}
-- 	},
-- }
require("telescope").setup {
  defaults = {
    initial_mode = "normal",
    -- `hidden = true` is not supported in text grep commands.
    hidden = true,
    vimgrep_arguments = {
        'rg',
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case',
        '--hidden',
    },
  };
  pickers = {
    find_files = {
      initial_mode = "insert",
      hidden = true,
    },
  },
  extensions = {
    repo = {
      list = {
        fd_opts = {
          "--no-ignore-vcs",
        },
        search_dirs = {
          "~/IdeaProjects",
        },
      },
    },
    project = {
     --  base_dirs = {
     --    '~/dev/src',
     --    {'~/dev/src2'},
     --    {'~/dev/src3', max_depth = 4},
     --    {path = '~/dev/src4'},
     --    {path = '~/dev/src5', max_depth = 2},
     --  },
      hidden_files = true, -- default: false
      theme = "dropdown",
      order_by = "asc",
      search_by = "title",
     -- sync_with_nvim_tree = true, -- default false
      -- default for on_project_selected = find project files
      on_project_selected = function(prompt_bufnr)
        -- Do anything you want in here. For example:
        project_actions.change_working_directory(prompt_bufnr, false)
        require("harpoon.ui").nav_file(1)
      end
    }
  },
}
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fa', builtin.git_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fj', builtin.jumplist, {})


vim.keymap.set('n', '<leader>fs', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>fw', builtin.grep_string, {})
-- vim.keymap.set("n","<leader>k", ":lua require('telescope').load_extension('k8s_commands').k8s()<CR>", opts)

-- Управление проектами (https://github.com/nvim-telescope/telescope-project.nvim)
-- require'telescope'.extensions.project.project{}

vim.keymap.set('n', '<C-e>', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>', {})

require'telescope'.load_extension'repo'
require('telescope').load_extension('dap')
require('telescope').load_extension('telescope-tabs')

-- Project
require('telescope').load_extension('project')
vim.keymap.set('n', '<leader>fp', function ()
  require'telescope'.extensions.project.project{display_type = 'full'}
end)

require("telescope-tabs").setup({
	-- entry_formatter = function(tab_id, buffer_ids, file_names, file_paths, is_current)
	-- 	local entry_string = table.concat(vim.tbl_map(function(v)
	-- 		return vim.fn.fnamemodify(v, ":.")
	-- 	end, file_paths), ', ')
	-- 	return string.format('%d: %s%s', tab_id, entry_string, is_current and ' <' or '')
	-- end
})

vim.keymap.set('n', '<leader>ft', function()
  require('telescope-tabs').list_tabs()
end)
