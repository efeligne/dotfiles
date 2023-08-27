local servers = {
  "html",
  "cssls",
  "sqlls",
  "tsserver",
  "clangd",
  "pyright",
  "tailwindcss",
}


return {
  'neovim/nvim-lspconfig',
  config = function()
    local config = require('lspconfig')
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    for _, lsp in ipairs(servers) do
      config[lsp].setup {
        capabilities = capabilities
      }
    end

    -- eslint
    config.eslint.setup {
      on_attach = function(_, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          command = "EslintFixAll"
        })
      end,
      capabilities = capabilities,
    }

    -- lua
    config.lua_ls.setup {
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
          },
          diagnostics = {
            globals = {
              "vim", "require",
            },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = {
            enable = false,
          },
          completion = {
            callSnippet = 'Replace'
          }
        },
      },
      on_attach = function(_, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          command = "lua vim.lsp.buf.format()",
        })
      end
    }

    -- rust
    config.rust_analyzer.setup {
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        require("completion").on_attach(client)
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          command = "RustFmt",
        })
      end,
      settings = {
        ["rust-analyzer"] = {
          imports = {
            granularity = {
              group = "module",
            },
            prefix = "self",
          },
          cargo = {
            buildScripts = {
              enable = true,
            },
          },
          diagnostics = true,
          procMacro = {
            enable = true,
          },
        },
      },
    }

    config.sourcekit.setup({
      cmd = { 'sourcekit-lsp' },
      capabilities = capabilities,
      on_attach = function()
        vim.api.nvim_create_autocmd('LspAttach', {
          group = vim.api.nvim_create_augroup('UserLspConfig', {}),
          callback = function(ev)
            -- enable omnifunc completion
            vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
          end
        })
      end
    })
  end,
  opts = {}
}
