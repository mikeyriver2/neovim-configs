local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.formatting.eslint_d,
        null_ls.builtins.completion.spell,
    },
})

vim.cmd('map <Leader>lf :lua vim.lsp.buf.format({ timeout_ms = 10000 })<CR>')

