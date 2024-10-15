local lsp_zero = require('lsp-zero')
local configs = require('lspconfig.configs')
local lspconfig = require('lspconfig')
local util = require('lspconfig.util')

lsp_zero.extend_lspconfig()
lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({ buffer = bufnr })

  local opts = { buffer = bufnr }
  vim.keymap.set({ 'n', 'x' }, 'gq', function()
    vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
  end, opts)

  vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', { buffer = bufnr })
  vim.keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<cr>', { buffer = bufnr })
  vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<cr>', { buffer = bufnr })
  vim.keymap.set('n', 'gu', '<cmd>Telescope lsp_document_symbols<cr>', { buffer = bufnr })
end)

-- Отключаю подсветку
-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/lsp.md#disable-semantic-highlights
-- lsp_zero.set_server_config({
--   on_init = function(client)
--     client.server_capabilities.semanticTokensProvider = nil
--   end,
-- })
--

local yamlcfg = require("yaml-companion").setup{
  builtin_matchers = {
    kubernetes = { enabled = true },
  },

  -- Additional schemas available in Telescope picker
  schemas = {
    {
      name = "Flux GitRepository",
      uri = "https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/main/gitrepository-source-v1.json",
    },
    {
      name = "Kubernetes 1.22.4",
      uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.22.4-standalone-strict/all.json",
    },
    {
      name = "gitlab-ci",
      uri = "https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json",
    },
  },

  -- Pass any additional options that will be merged in the final LSP config
  -- Defaults: https://github.com/someone-stole-my-name/yaml-companion.nvim/blob/main/lua/yaml-companion/config.lua
  lspconfig = {
    settings = {
      yaml = {
        validate = true,
        schemaStore = {
          enable = false,
          url = "",
        },
        customTags = {
          "!reference sequence",
        },
        schemas = require('schemastore').yaml.schemas {
          replace = {
            ['gitlab-ci'] = {
              description = 'configuring Gitlab CI',
              fileMatch = {
                '*.gitlab-ci.yml',
                '*gitlab-ci**',
              },
              name = 'gitlab-ci',
              url = 'https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json',
            },
          },
        }
      }
    }
  }
}


require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "gopls" },

  pip = {
    ---@since 1.0.0
    -- Whether to upgrade pip to the latest version in the virtual environment before installing packages.
    upgrade_pip = true,

    ---@since 1.0.0
    -- These args will be added to `pip install` calls. Note that setting extra args might impact intended behavior
    -- and is not recommended.
    --
    -- Example: { "--proxy", "https://proxyserver" }
    install_args = {},
  },


  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      require('lspconfig').lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = { 'vim' },
            },
          },
        }
      })
    end,
    gopls = function()
      require('lspconfig').gopls.setup({
        on_init = function(client)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentFormattingRangeProvider = false
        end,
      })
    end,
    yamlls = function()
      require('lspconfig').yamlls.setup(yamlcfg)
    end,
    -- helm_ls = function()
    --   if not configs.helm_ls then
    --     configs.helm_ls = {
    --       default_config = {
    --         cmd = {"helm_ls", "serve"},
    --         filetypes = {'helm'},
    --         root_dir = function(fname)
    --           return util.root_pattern('Chart.yaml')(fname)
    --         end,
    --       },
    --     }
    --   end

    --   lspconfig.helm_ls.setup {
    --     filetypes = {"helm"},
    --     cmd = {"helm_ls", "serve"},
    --   }

    -- end
  },
})


