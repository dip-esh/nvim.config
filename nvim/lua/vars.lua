local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("i", "jk", "<esc>")
map("n", "<leader>w", ":w<CR>")
map("n", "<leader>q", ":q!<CR>")
map("n", "<leader>s", ":so %<CR>")
map("n", "<leader>ev", ":w<cr>:tabedit $MYVIMRC<cr>")
map("n", "<leader>sv", ":w<cr>:source $MYVIMRC<cr>")
