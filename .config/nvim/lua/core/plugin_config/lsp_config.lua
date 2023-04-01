require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "clangd", "html", "cssls", "quick_lint_js", "bashls", "marksman" }
})

local on_attach = function(_, _)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<leader>co', vim.lsp.buf.code_action, {})

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
  vim.keymap.set('n', 'K',  vim.lsp.buf.hover, {})
end

require("lspconfig").lua_ls.setup {
  on_attach = on_attach
}
require("lspconfig").clangd.setup {
  on_attach = on_attach
}
require("lspconfig").html.setup {
  on_attach = on_attach
}
require("lspconfig").cssls.setup {
  on_attach = on_attach
}
require("lspconfig").quick_lint_js.setup {
  on_attach = on_attach
}
require("lspconfig").bashls.setup {
  on_attach = on_attach
}
require("lspconfig").marksman.setup {
  on_attach = on_attach
}
