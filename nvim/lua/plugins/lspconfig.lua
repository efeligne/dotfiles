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
    for _, lsp in ipairs(servers) do
      config[lsp].setup {}
    end

    -- eslint
    config.eslint.setup {
      on_attach = function(_, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          command = "EslintFixAll"
        })
      end,
    }

    -- lua
    config.lua_ls.setup {
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
