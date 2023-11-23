-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'}, {'BurntSushi/ripgrep'} }

    }
    use('Mofiqul/dracula.nvim')

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment these if you want to manage LSP servers from neovim
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- LSP Support
            {'neovim/nvim-lspconfig'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},

        }
    }
    use {
        'pearofducks/ansible-vim',
        run = './UltiSnips/generate.sh'
    }
    use('nvim-lua/popup.nvim')
    -- use('frenchtoasters/telescope-kubectl.nvim')
    use({
      "coffebar/neovim-project",
      config = function()
        -- enable saving the state of plugins in the session
        vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
      end,
      requires = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope.nvim", tag = "0.1.4" },
        { "Shatur/neovim-session-manager" },
      }
    })

    use {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
      }
    }
end)

