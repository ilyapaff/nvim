local builtin = require('telescope.builtin')
-- local tele = require('telescope')
-- tele.load_extension('k8s_commands')
-- tele.setup {
--   extensions = {
-- 		k8s_commands = {
-- 			k8s_cmd = "kubectl" -- defaults to kubectl
-- 		}
-- 	},
-- }

local telescopeConfig = require("telescope.config")
-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")
-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")

require("telescope").setup {
  defaults = {
    initial_mode = "normal",
    -- `hidden = true` is not supported in text grep commands.
    hidden = true,
    vimgrep_arguments = vimgrep_arguments,
    file_ignore_patterns = {
      "node_modules", "build", "dist", "yarn.lock"
    },
  };
  pickers = {
    find_files = {
      initial_mode = "insert",
      hidden = true,
      -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
      find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
    },
    live_grep = {
      additional_args = function(_ts)
        return {"--hidden"}
      end
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
  },
}
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
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
