local cmp = require('cmp')
local lsp = vim.lsp.protocol.CompletionItemKind

vim.api.nvim_set_hl(0, "CmpNormal", { bg = "#FF0000" })
vim.cmd([[highlight Pmenu guifg=#000000 guibg=#ffffff]])


-- Function to modify LSP completion items
local function fix_tsx_completion(entry, item)
    -- Completion kinds commonly used for string/value attributes in TSX/JSX
    local attribute_kinds = {
        lsp.Text, 
        lsp.Color, 
        lsp.Enum, 
        lsp.Value, 
        lsp.Field
    }

    if vim.tbl_contains(attribute_kinds, item.kind) then
        -- This forces nvim-cmp to use basic text insertion instead of the 
        -- LSP's textEdit, preventing the aggressive overwrite.
        item.textEdit = nil
    end

    -- Always return true to keep the entry in the list
    return true
end

cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    sources = cmp.config.sources({
      {
        name = 'nvim_lsp',
        entry_filter = fix_tsx_completion,
      },
      -- { name = 'vsnip' }, -- For vsnip users.
      { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    }),
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),

})
