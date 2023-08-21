local ensure_installed = {
  lsp = {
    -- lua stuff
    "lua_ls",

    -- sql
    "sqlls",

    -- web dev stuff
    "cssls",
    "html",
    "tsserver",
    "denols",
    "eslint",
    "tailwindcss",

    -- c/cpp stuff
    "clangd",

    -- rust stuff
    "rust_analyzer",

    -- python stuff
    "pyright",

    -- xml stuff
    "lemminx",
  },
  null_ls = {
    -- formatting
    "prettierd",
    "stylua",

    -- debug
    "chrome-debug-adapter",
    "js-debug-adapter",
    "firefox-debug-adapter",
    "node-debug2-adapter",
  },
}

return {
  "williamboman/mason.nvim",
  opts = {},
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "jay-babu/mason-null-ls.nvim",
  },
  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_uninstalled = "✗",
          package_pending = "⟳",
        }
      }
    })
    require("mason-lspconfig").setup({
      ensure_installed = ensure_installed.lsp,
    })
    require("mason-null-ls").setup({
      ensure_installed = ensure_installed.null_ls,
      automatic_installation = false,
    })
  end,
}
