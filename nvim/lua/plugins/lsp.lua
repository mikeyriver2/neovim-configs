vim.diagnostic.config({ virtual_text = true })

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "tsserver","eslint" } 
})

require'lspconfig'.tsserver.setup {
  capabilities = capabilities,
}
