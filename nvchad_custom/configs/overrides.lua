local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "vimdoc",

    "javascript",
    "typescript",
    "html",
    "css",
    "jsdoc",
    "tsx",

    "luadoc",
    "luap",

    "python",
    "query",
    "regex",
    "json",
    "c",

    "markdown",
    "markdown_inline",

    "yaml",
    "swift",
    "lua",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "tailwindcss-language-server",
    "deno",
    "prettier",
    "eslint_d",
    "node-debug2-adapter",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- sql
    "sqlls",
    "sql-formatter",

    -- vim
    "vim-language-server",

    -- markdown
    "marksman",

    -- python
    "pyright"
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
