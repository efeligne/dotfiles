local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = {},
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.rustfmt,
        null_ls.builtins.formatting.swift_format,
        null_ls.builtins.diagnostics.swiftlint,
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({
            group = augroup,
            buffer = bufnr,
          })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({
                bufnr = bufnr,
                filter = function(_client)
                  return _client.name == "null-ls"
                end,
              })
            end,
          })
        end
      end,
    })
  end,
}
