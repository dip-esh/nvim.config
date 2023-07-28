-- # what is i try to add g to all its keymap
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local on_attach = function()
    -- vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
    -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
    -- vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
    -- vim.keymap.set("n", "gr", vim.lsp.buf.rename, { buffer = 0 })
    -- send document hightlight request to all server
end

require("lspconfig")["pyright"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

require("lspconfig")["pylsp"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    enabled = true,
                    maxLineLength = 100,
                },
                pydocstyle = {
                    enabled = true,
                },
                rope_autoimport = {
                    enabled = true,
                },
                rope_completion = {
                    enabled = true,
                },
            },
        },
    },
})

require("lspconfig").rust_analyzer.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})
require("lspconfig")["lua_ls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        diagnostics = {
            globals = { "vim" },
        },
    },
})

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set("n", "<space>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<space>f", function()
            vim.lsp.buf.format({ async = true })
        end, opts)
    end,
})
