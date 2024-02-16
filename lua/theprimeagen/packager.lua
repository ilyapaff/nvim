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
    -- Project
    use {"cljoly/telescope-repo.nvim"}
    use { 'nvim-telescope/telescope-project.nvim' }
    use {
      'nvim-telescope/telescope-file-browser.nvim',
      requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    }
    use {'LukasPietzschmann/telescope-tabs'}

    use('Mofiqul/dracula.nvim')

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')

    -- набор готовых сниппетов для всех языков, включая go
    use 'rafamadriz/friendly-snippets'
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
            {
              'L3MON4D3/LuaSnip',
              after = 'friendly-snippets',
            },

        }
    }
    use {
        'pearofducks/ansible-vim',
        run = './UltiSnips/generate.sh'
    }
    use('nvim-lua/popup.nvim')
    -- use('frenchtoasters/telescope-kubectl.nvim')

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

    use {"towolf/vim-helm"}
    use {"preservim/tagbar"}


    -- Дебагер
    use {"mfussenegger/nvim-dap"}
    use {"leoluz/nvim-dap-go"}
    use {"nvim-telescope/telescope-dap.nvim"}
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

    -- автоматические закрывающиеся скобки
    use {'windwp/nvim-autopairs'}

    -- ИИ автодополнения
    use {
      'tzachar/cmp-tabnine',
      run='./install.sh'
    }

    -- Поддержка .env
    use {'tpope/vim-dotenv'}

    -- Управление терминалами
    use {"akinsho/toggleterm.nvim", tag = '*'}

    -- Управление вкладками
    use 'lewis6991/gitsigns.nvim' -- OPTIONAL: for git status
    use 'romgrk/barbar.nvim'
    use {'tiagovla/scope.nvim'}

    -- Asciidoc 
    use {'shuntaka9576/preview-asciidoc.vim', requires = {'vim-denops/denops.vim'}}
end)

